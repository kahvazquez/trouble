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

  public static function entrar()
  {

    return function ($req, $res, $svc, $app) {

      $res->body($app->template->render('login'))->send();

    };

  }

  public static function autenticar()
  {
    return function ($req, $res, $svc, $app) {

      $app->user->authorizeGoogleUser($req->paramsPost()->token);

      if (!$app->user->isLoggedIn()) {

        Flash::warning('Usuário não autorizado');
        return $res->redirect('/entrar');

      }

      $res->redirect('/');

    };
  }

  public static function sair()
  {
    return function ($req, $res, $svc, $app) {

      $app->user->logout();

      $res->redirect('/');

    };
  }

}