<?php

namespace ksv\trouble;

use \McKay\Flash;

class Base
{

  static function home()
  {

    return function ($req, $res, $svc, $app) {

      $res->body($app->template->render('home'))->send();

    };

  }

  static function entrar()
  {

    return function ($req, $res, $svc, $app) {

      $res->body($app->template->render('login'))->send();

    };

  }

  static function autenticar()
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

  static function sair()
  {
    return function ($req, $res, $svc, $app) {

      $app->user->logout();

      $res->redirect('/');

    };
  }

}