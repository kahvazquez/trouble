<?php

namespace ksv\trouble;

use McKay\Flash;

class Admin
{

  private static function placeholderGroup()
  {
    $newGroup = new \stdClass();
    $newGroup->id = 'novo';
    $newGroup->name = 'Novo Grupo';
    $newGroup->isNew = TRUE;
    return $newGroup;
  }

  private static function groupPermissions($db, $group)
  {

    return array_map(

      function ($perm) {
        $perm->hasPermission = $perm->groupPermission
          ? TRUE : FALSE;
        return $perm;
      },

      $db->permission
        ->raw_query("
          SELECT
            permission.id,
            permission.name,
            group_permission.id groupPermission
          FROM permission
          LEFT JOIN group_permission ON (
            permission.id = group_permission.permission
            AND group_permission.group = :group
          )", ['group' => $group->id]
        )->find_many()

    );

  }

  private static function groupUsers($db, $group, $uid)
  {

    if ($group->isNew) {

      $groupUsers = $db
        ->user
        ->raw_query("
          SELECT
            user.id, user.name
          FROM user
          WHERE
            (
              SELECT count(*)
              FROM user_group
              WHERE
                user_group.user = user.id
            ) = 0
        ")->find_many();

    } else {

      $groupUsers = $db
        ->user_group
        ->select_many('user.id', 'user.name')
        ->join('user', 'user_group.user = user.id')
        ->where_equal('user_group.group', $group->id)
        ->find_many();

    }

    $users = array_map(

      function ($user) use ($db, $uid) {

        $user = (object)$user->as_array();
        $user->isNew = FALSE;
        $user->isActive = $user->id === $uid;

        if ($user->isActive) {

          $myGroups = $db->user_group
            ->select('group', 'id')
            ->where_equal('user', $user->id)
            ->find_many();

          $user->groups = [];

          foreach ($myGroups as $myGroup) {
            $user->groups[$myGroup->id] = TRUE;
          }

          $user->emails = array_map(

            function ($e) {
              return $e->id;
            },

            $db->user_email
              ->where_equal('user', $user->id)
              ->find_many()

          );

        }

        return $user;

      },

      $groupUsers

    );

    $placeholder = new \stdClass();

    $placeholder->id = 'novo';
    $placeholder->isActive = 'novo' === $uid;
    $placeholder->name = 'Novo usuário';
    $placeholder->isNew = TRUE;
    $placeholder->groups = [];
    $placeholder->emails = [];

    $users[] = $placeholder;

    return $users;
  }

  static function listar()
  {
    return function ($req, $res, $svc, $app) {

      $id = $req->id;
      $tab = isset($req->tab) ? $req->tab : 'info';

      if ($id === 'novo') {
        $activeGroup = self::placeholderGroup();
      } else {
        $activeGroup = $app->db->group->find_one($id);
      }

      $activeGroup->users = $tab === 'usuarios'
        ? self::groupUsers($app->db, $activeGroup, $req->uid)
        : [];

      if ($tab === 'permissoes') {
        $activeGroup->permissions = self::groupPermissions($app->db, $activeGroup);
      } else {
        $activeGroup->permissions = [];
      }

      $groups = $app->db->group->find_many();
      $groups[] = self::placeholderGroup();

      $html = $app->template->render('admin', [
        'tab' => $tab,
        'activeGroup' => $activeGroup,
        'uid' => $req->uid,
        'groups' => array_map(function ($group) use ($id) {
          $group->isActive = $id === $group->id;
          return $group;
        }, $groups)
      ]);

      $res->body($html)->send();

    };
  }

  static function salvarUsuario()
  {
    return function ($req, $res, $svc, $app) {

      $input = $req->paramsPost();

      if ($req->id !== 'novo') {

        $user = $app->db->user->find_one($req->id);

      } else {

        $user = $app->db->user->create();

      }

      $user->name = $input->name;
      $user->save();

      $id = $req->id !== 'novo'
        ? $user->id
        : $user->id();

      if ($input->email) {

        $email = $app->db->user_email->create();
        $email->user = $id;
        $email->id = $input->email;

        try {

          $email->save();

        } catch (\Exception $e) {

          Flash::error('Esse email já está em uso.');

        }

      }

      $currentGroup = $req->group;

      $selectedGroups = $input->groups ? array_flip($input->groups) : [];
      $newGroups = $selectedGroups;

      $userGroups = $app->db
        ->user_group
        ->where_equal('user', $id)
        ->find_many();

      foreach ($userGroups as $userGroup) {

        if (isset($selectedGroups[$userGroup->id])) {
          unset($newGroups[$userGroup->id]);
        } else {
          $userGroup->delete();
        }

      }

      foreach ($newGroups as $selectedGroup => $val) {
        $sG = $app->db->user_group->create();
        $sG->user = $id;
        $sG->group = $selectedGroup;
        $sG->save();
      }

      if (empty($selectedGroups[$currentGroup])) {
        $currentGroup = count($selectedGroups)
          ? array_keys($selectedGroups)[0]
          : 'novo';
      }

      Flash::success('Usuário salvo com sucesso');

      $res->redirect("/admin/grupo/{$currentGroup}/usuarios/{$id}");

    };
  }

  static function salvarGrupo()
  {
    return function ($req, $res, $svc, $app) {

      if ($req->id !== 'novo') {
        $group = $app->db->group->find_one($req->id);
      } else {
        $group = $app->db->group->create();
      }

      $group->name = $req->paramsPost()->name;
      $group->save();

      $id = $req->id !== 'novo' ? $req->id : $group->id();

      $res->redirect("/admin/grupo/{$id}");

    };
  }

  static function salvarPermissoesGrupo()
  {
    return function ($req, $res, $svc, $app) {

      $groupPermissions = $app->db
        ->group_permission
        ->where_equal('group', $req->id)
        ->find_many();

      $newPermissions = $req->paramsPost()->permissions;
      if (!$newPermissions) $newPermissions = [];

      foreach ($groupPermissions as $groupPermission) {
        if (!isset($newPermissions[$groupPermission->id])) {
          $groupPermission->delete();
        } else {
          unset($newPermissions[$groupPermission->id]);
        }
      }

      foreach ($newPermissions as $id => $val) {

        $permission = $app->db->group_permission->create();
        $permission->permission = $id;
        $permission->group = $req->id;
        $permission->save();

      }

      Flash::success('Permissões atualizadas');

      $svc->back();

    };
  }

  static function removeUsuario()
  {
    return function ($req, $res, $svc, $app) {

      $app->db->user
        ->find_one($req->id)
        ->delete();

      Flash::success('Usuário removido com sucesso');

      $res
        ->code(204)
        ->header('X-Location', $req->headers()->referer)
        ->send();

    };
  }

  static function removeGrupo()
  {
    return function ($req, $res, $svc, $app) {

      $app->db->group
        ->find_one($req->id)
        ->delete();

      Flash::success('Grupo removido com sucesso');

      $res
        ->code(204)
        ->header('X-Location', '/admin/grupo/novo')
        ->send();

    };
  }

  static function removeEmail()
  {
    return function ($req, $res, $svc, $app) {

      $app->db
        ->user_email
        ->find_one($req->id)
        ->delete();

      Flash::success('Email removido com sucesso');

      $res
        ->code(204)
        ->header('X-Location', $req->headers()->referer)
        ->send();

    };
  }

}