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

      $html = $app->template->render('cadastrar-equipamento', [
       'cidades' => $app->db->cidade->find_many(),
       ]);

      $res->body($html)->send();


    };

  }

  static function salvar()
  {

    return function ($req, $res, $svc, $app) {

      $newEquipamento = $req ->paramsPost();

      $equipamento = $app->db->equipamento->create();

      $equipamento->cidade = $newEquipamento->cidade;
      $equipamento->fabricante = $newEquipamento->fabricante;
      $equipamento->ident = $newEquipamento->ident;
      $equipamento->equipamento = $newEquipamento->equipamento;
      $equipamento->localizacao = $newEquipamento->localizacao;
      $equipamento->tipo_acesso = $newEquipamento->tipo_acesso;
      $equipamento->ip = $newEquipamento->ip;
      $equipamento->ip_interno = $newEquipamento->ip_interno;
      $equipamento->login = $newEquipamento->login;
      $equipamento->senha = $newEquipamento->senha;

      $equipamento->save();

      $res->redirect("/equipamentos");

    };

  }


}