<?php

namespace ksv\trouble;

class Equipamentos
{

  static function listar()
  {

    return function ($req, $res, $svc, $app) {

      $cidades = $app->db->cidade->find_many();
      $equipamentos = $app->db->equipamento;
      $cidade = $req->cidade;

      if ($cidade) {
        $equipamentos->where_equal('cidade', strtoupper($cidade));
      }

      $html = $app->template->render('equipamentos', [
        'selected' => (object)['cidade' => $cidade],
        'cidades' => $cidades,
        'equipamentos' => $equipamentos->find_many()
      ]);

      $res->body($html)->send();

    };

  }

  static function cadastrar()
  {

    return function ($req, $res, $svc, $app) {

      $res->body($app->template->render('cadastrar'))->send();

    };

  }

}