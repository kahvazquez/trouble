<?php

namespace ksv\trouble;

class Tickets {

	public static function filter($req, $app) {

		$tickets = $app->db->t_ticket;

		$cidade = $req->param('cidade');

		if ($cidade) {
			$tickets->where_equal('cidade', strtoupper($cidade));
		}

		return $tickets->find_many();

	}

	public static function xls() {
		return function ($req, $res, $svc, $app) {

			$time = time();
			$date = date('d-m-Y');
			$exportFile = __DIR__ . "/xls/relatorio-tickets-{$time}.xlsx";

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
			$writer->writeSheet($headers + $rows, 'Relatório ' . $date);
			$writer->setAuthor('Sim TV - Trouble Ticket');
			$writer->writeToFile($exportFile);

			$res->file($exportFile, "Relatório Tickets {$date}.xlsx");

		};
	}



	public static function lista() {

		return function ($req, $res, $svc, $app) {

			$html = $app->template->render('tickets', [
				'selected' => (object)['cidade' => $req->param('cidade')],
				'tickets' => Tickets::filter($req, $app),
				'cidades' => $app->db->cidade->find_many()
			]);

			$res->body($html)->send();

		};

	}

  public static function editar() {

    return function ($req, $res, $svc, $app) {

      $html = $app->template->render('editar-ticket', [
        'statuses' => $app->db->status->find_many(),
        'ticket' => $app->db->t_ticket->find_one($req->id)
      ]);

      $res->body($html)->send();

    };

  }

}