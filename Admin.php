<?php

namespace ksv\trouble;

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

  private static function groupUsers($db, $group)
  {
    $users = array_map(

      function ($user) use ($db) {

        $user = (object)$user->as_array();
        $user->isNew = FALSE;

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

        return $user;

      },

      $db->user_group
        ->select_many('user.id', 'user.name')
        ->join('user', 'user_group.user = user.id')
        ->where_equal('user_group.group', $group->id)
        ->find_many()

    );
    $placeholder = new \stdClass();

    $placeholder->id = 'novo';
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
      $tab = $req->tab;

      if ($id === 'novo') {
        $activeGroup = self::placeholderGroup();
        $activeGroup->users = [];
      } else {
        $activeGroup = $app->db->group->find_one($id);
        $activeGroup->users = $tab === 'usuarios'
          ? self::groupUsers($app->db, $activeGroup)
          : [];
      }

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
        'groups' => array_map(function ($group) use ($id) {
          $group->isActive = $id === $group->id;
          return $group;
        }, $groups)
      ]);

      $res->body($html)->send();

    };
  }

}