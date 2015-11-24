<?php

namespace ksv\trouble;

use McKay\Flash;

class Tickets
{

  static function filter($req, $app)
  {

    $tickets = $app->db->ticket;

    $cidade = $req->cidade;

    if ($cidade) {
      $tickets->where_equal('cidade', strtoupper($cidade));
    }

    $status = $req->status;

    if ($status) {
      $tickets->where_equal('status', $status);
    }

    return $tickets->find_many();

  }

  static function xls()
  {
    return function ($req, $res, $svc, $app) {

      $time = date('H:i:s', time());
      $date = date('d-m-Y');
      $exportFile = __DIR__ . "/../xls/relatorio-tickets-{$time}.xlsx";

      $headers = [
        [
          'Protocolo',
          'Operadora',
          'Status',
          'Cidade',
          'Problema',
          'Designação',
          'Cliente Final',
          'Data'
        ]
      ];

      $rows = array_map(function ($ticket) {

        return [
          $ticket->protocolo,
          $ticket->operadora,
          $ticket->status,
          $ticket->cidade,
          $ticket->tipo_problema,
          $ticket->designacao,
          $ticket->cliente_final,
          date('d/m/Y', strtotime($ticket->criado_em))
        ];

      }, Tickets::filter($req, $app));

      $writer = new \XLSXWriter();
      $writer->writeSheet(array_merge($headers, $rows), 'Relatório ' . $date);
      $writer->setAuthor('Sim TV - Trouble Ticket');
      $writer->writeToFile($exportFile);

      $res->file($exportFile, "Relatório Tickets {$time}.xlsx");

    };
  }

  static function listar()
  {

    return function ($req, $res, $svc, $app) {

      $html = $app->template->render('tickets', [
        'selected' => (object)['cidade' => $req->cidade, 'status' => $req->status],
        'tickets' => Tickets::filter($req, $app),
        'cidades' => $app->db->cidade->find_many(),
        'statuses' => $app->db->status->find_many()
      ]);

      $res->body($html)->send();

    };

  }

  static function editar()
  {

    return function ($req, $res, $svc, $app) {

      $html = $app->template->render('editar-ticket', [
        'statuses' => $app->db->status->find_many(),
        'ticket' => $app->db->ticket->find_one($req->id)
      ]);

      $res->body($html)->send();

    };

  }

  static function criar()
  {

    return function ($req, $res, $svc, $app) {

      $clientes = $app->db->cadcliente;
      $cidade = $req->cidade;

      if ($cidade) {

      $clientes->where_equal('cliente' , strtoupper($cliente));

      }

      $html = $app->template->render('criar-ticket', [
        'operadoras' => $app->db->operadora->find_many(),
        'cidades' => $app->db->cidade->find_many(),
        'statuses' => $app->db->status->find_many(),
        'clientes' => $clientes->find_many(),
        'ticket' => $app->db->ticket->create()
      ]);

      $res->body($html)->send();

    };

  }

  static function salvar()
  {
    return function ($req, $res, $svc, $app) {

      $newTicket = $req->paramsPost();
      $isNew = empty($req->id);

      if ($isNew) {
        $ticket = $app->db->ticket->create();

        $ticket->criado_em = date('Y-m-d H:i:s');
        $ticket->protocolo = date('YmdHis');
        $ticket->operadora = $newTicket->operadora;
        $ticket->cidade = $newTicket->cidade;
        $ticket->tipo_problema = $newTicket->tipo_problema;
        $ticket->cliente_final = $newTicket->cliente_final;
        $ticket->designacao = $newTicket->designacao;

      } else {

        $ticket = $app->db->ticket->find_one($req->id);

      }

      $ticket->previsao = $newTicket->previsao;
      $ticket->status = $newTicket->status;
      $ticket->telefone = $newTicket->telefone;
      $ticket->obs = $newTicket->obs;

      $ticket->save();

      $id = $isNew
        ? $ticket->id()
        : $req->id;

      Flash::success('Salvo com sucesso');

      $res->redirect("/ticket/{$id}");

    };
  }

}