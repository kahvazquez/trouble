<?php

namespace ksv\trouble;

class Clientes
{

  static function listar()
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

  static function criar()

  {

    return function ($req, $res, $svc, $app) {


      $html = $app->template->render('criar-cliente', [
       'operadoras' => $app->db->operadora->find_many(),
       'cidades' => $app->db->cidade->find_many(),
       'velocidades' =>$app->db->velocidade->find_many()
       ]);

      $res->body($html)->send();


    };

  }

  static function editar()
  {

    return function ($req, $res, $svc, $app) {

      $html = $app->template->render('editar-cliente', [
      'operadoras' => $app->db->operadora->find_many(),
       'cidades' => $app->db->cidade->find_many(),
       'velocidades' =>$app->db->velocidade->find_many(),
       'cliente' => $app->db->cadcliente->find_one($req->id)

      ]);

      $res->body($html)->send();

    };

  }

  static function salvar()
  {
    return function ($req, $res, $svc, $app) {

      $newCliente = $req->paramsPost();
      $isNew = empty($req->id);

      if ($isNew) {

        $cliente = $app->db->cadcliente->create();
        $cliente->set_expr('data', 'now()');

      } else {

        $cliente = $app->db->cadcliente->find_one($req->id);

      }

      $cliente->cidade = $newCliente->cidade;
      $cliente->status = $newCliente->status;
      $cliente->contrato = $newCliente->contrato;
      $cliente->designacao = $newCliente->designacao;
      $cliente->cliente = $newCliente->cliente;
      $cliente->velocidade = $newCliente->velocidade;
      $cliente->operadora = $newCliente->operadora;
      $cliente->endereco = $newCliente->endereco;
      $cliente->equipamento = $newCliente->equipamento;

      $cliente->save();

      $id = $isNew
        ? $cliente->id()
        : $req->id;

      $res->redirect("/cliente/{$id}");

    };

  }

}