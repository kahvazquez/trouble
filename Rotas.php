<?php

namespace ksv\trouble;

require_once 'vendor/autoload.php';

class Rotas {
	
	public static function raiz() {

		return function ($req, $res, $svc, $app) {

			$html = $app->template->render('home', [
				'name' => $app->db->test->where_equal('id', 1)->find_one()->name
			]);

			$res->body($html)->send();

		};

	}

	public static function ticketsXls() {
		return function ($req, $res, $svc, $app) {
			
			
			
			$exportFile = __DIR__ . '/xls/export.xls';
			
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
					$ticket->date
				];

			}, $app->db->t_ticket->find_many());
			
			
			
			$writer = new \XLSXWriter();
			$writer->writeSheet($headers + $rows, 'Relatório ' . date('d-m-Y'));
			$writer->setAuthor('Sim TV - Trouble Ticket');
			$writer->writeToFile($exportFile);
			
			$res->file($exportFile);
			
		};
	}	
	
	public static function equipamentos() {

		return function ($req, $res, $svc, $app) {

			$cidades = $app->db->cidade->find_many();
			$equipamentos = $app->db->equipamentos;
			$cidade = $req->param('cidade'); 

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
	
	public static function tickets() {
		
		return function ($req, $res, $svc, $app) {
		
			$tickets = $app->db->t_ticket->find_many();
			
			$html = $app->template->render('tickets', [
				'tickets' => $tickets
			]);
		
			$res->body($html)->send();
	
		};
		
	}
	
}