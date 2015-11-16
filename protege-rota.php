<?php

namespace ksv\trouble;

function protege($fn, $pageId = NULL)
{

  return function ($req, $res, $svc, $app) use ($fn, $pageId) {

    if (!$app->user->isLoggedIn()) {

      return $res->code(401)
        ->body('Não autorizado')->send();

    }

    if ($pageId) {

      $page = $app->db->page->find_one($pageId);

      if (!$app->user->hasPermission($page->permission)) {

        return $res->code(401)
          ->body('Não autorizado')->send();

      }

    }

    $fn($req, $res, $svc, $app);

  };

}