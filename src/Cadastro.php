<?php

namespace ksv\trouble;

use \McKay\Flash;

class Cadastro
{

static function listar()
  {

    return function ($req, $res, $svc, $app) {

      $res->body($app->template->render('cadastro'))->send();

    };

  }

static function salvar()
  {

    return function ($req, $res, $svc, $app) {

      $newVelocidade = $req->paramsPost();

      $velocidade = $app->db->velocidade->create();

      $velocidade->velocidade = $newVelocidade->velocidade;


      $velocidade->save();

      Flash::success('Velocidade cadastrada com sucesso');

      $res->redirect("/cadastro");

    };

  }


}