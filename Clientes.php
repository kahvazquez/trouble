<?php

namespace ksv\trouble;

class Clientes
{

  public static function listar()
  {

    return function ($req, $res, $svc, $app) {

      $cidades = $app->db->cidade->find_many();
      $clientes = $app->db->cadcliente;
      $cidade = $req->cidade;

      if ($cidade) {
        $clientes->where_equal('cidade', strtoupper($cidade));
      }

      $html = $app->template->render('clientes', [
        'selected' => (object)['cidade' => $cidade],
        'cidades' => $cidades,
        'clientes' => $clientes->find_many()
      ]);

      $res->body($html)->send();

    };

  }

 public function criar()

   {

    return function ($req, $res, $svc, $app) {


      $html = $app->template->render('criar-clientes', [
       'operadoras' => $app->db->operadora->find_many(),
       ]);

      $res->body($html)->send();


    };

  }

}