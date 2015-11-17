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
    return $db
      ->user_group
      ->select_many('user.id', 'user.name')
      ->join('user', 'user_group.user = user.id')
      ->where_equal('user_group.group', $group->id)
      ->find_many();
  }

  static function base()
  {

    return function ($req, $res, $svc, $app) {
      return $res->redirect('/admin/grupo/novo');
    };

  }

  static function listar()
  {
    return function ($req, $res, $svc, $app) {

      $id = $req->id;

      if ($id === 'novo') {

        $activeGroup = self::placeholderGroup();
        $activeGroup->users = [];

      } else {

        $activeGroup = $app->db->group->find_one($id);
        $activeGroup->users = self::groupUsers($app->db, $activeGroup);

      }

      $activeGroup->permissions = self::groupPermissions($app->db, $activeGroup);

      $groups = $app->db->group->find_many();
      $groups[] = self::placeholderGroup();

      $html = $app->template->render('admin', [
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