<?php

namespace ksv\trouble;

function protege($fn)
{

  return function ($req, $res, $svc, $app) use ($fn) {

    if (!$app->user->isLoggedIn()) {

      return $res->code(401)
        ->body('Não autorizado')->send();

    }

    $fn($req, $res, $svc, $app);

  };

}