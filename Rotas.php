<?php

namespace ksv\trouble;

require_once 'vendor/autoload.php';

class Rotas
{

  public static function raiz()
  {

    return function ($req, $res, $svc, $app) {

      $html = $app->template->render('home');

      $res->body($html)->send();

    };

  }

}