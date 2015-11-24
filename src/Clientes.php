<?php

namespace ksv\trouble;

use McKay\Flash;

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

      $equipamentos = $app->db->equipamento;
      $cidade = $req->cidade;

      if ($cidade) {
        $equipamentos->where_equal('ident', strtoupper($equipamento));
      }

      $html = $app->template->render('criar-cliente', [
        'operadoras' => $app->db->operadora->find_many(),
        'cidades' => $app->db->cidade->find_many(),
        'velocidades' => $app->db->velocidade->find_many(),
        'equipamentos' => $equipamentos->find_many(),
        'cliente' => $app->db->cadcliente->create()
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
        'velocidades' => $app->db->velocidade->find_many(),
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

      Flash::success('Salvo com sucesso');

      $res->redirect("/cliente/{$id}");

    };

  }

  static function xls()
  {
    return function ($req, $res, $svc, $app) {

      $time = date('H:i:s', time());
      $date = date('d-m-Y');
      $exportFile = __DIR__ . "/../xls/relatorio-clientes-{$time}.xlsx";

      $headers = [
        [
          'Cidade',
          'Contrato',
          'Designação',
          'Cliente',
          'Velocidade',
          'Operadora',
          'Equipamento',
          'Endereço',
          'Criado em',
        ]
      ];
      $clientes = $app->db->cadcliente;
      if ($req->cidade) {
        $clientes->where_equal('cidade', $req->cidade);
      }

      $rows = array_map(function ($cliente) {

        return [
          $cliente->cidade,
          $cliente->contrato,
          $cliente->designacao,
          $cliente->cliente,
          $cliente->velocidade,
          $cliente->operadora,
          $cliente->equipamento,
          $cliente->endereco,
          date('d/m/Y', strtotime($cliente->data))
        ];

      }, $clientes->find_many());

      $writer = new \XLSXWriter();
      $writer->writeSheet(array_merge($headers, $rows), 'Relatório ' . $date);
      $writer->setAuthor('Sim TV - Trouble Ticket');
      $writer->writeToFile($exportFile);

      $res->file($exportFile, "Relatório Cliente {$time}.xlsx");

    };
  }

}