<?php

namespace ksv\trouble;

require_once 'vendor/autoload.php';

use \McKay\Flash;

class Base
{

  public static function home()
  {

    return function ($req, $res, $svc, $app) {

      $res->body($app->template->render('home'))->send();

    };

  }

  public static function loginGoogle()
  {
    return function ($req, $res, $svc, $app) {

      $app->user->authorizeGoogleUser($req->paramsPost()->token);

      if (!$app->user->isLoggedIn()) {

        Flash::warning('Usuário não autorizado');

      }

      $res->redirect('/');

    };
  }

  public static function logout()
  {
    return function ($req, $res, $svc, $app) {

      $app->user->logout();

      $res->redirect('/');

    };
  }

}