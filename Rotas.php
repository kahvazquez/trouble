<?php

namespace ksv\trouble;

class Rotas {
	
	public static function raiz() {

		return function ($req, $res, $svc, $app) {

			$html = $app->template->render('home', [
				'name' => $app->db->test->where_equal('id', 1)->find_one()->name
			]);

			$res->body($html)->send();

		};

	}
	
	public static function equipamentos() {
		
		return function ($req, $res, $svc, $app) {
		
			$equipamentos = $app->db->equipamentos;
			$cidade = $req->params('cidade'); 
			
			if ($cidade) {
				$equipamentos = $equipamentos->where_equal('cidade', strtoupper($cidade));
			}
			
			$html = $app->template->render('equipamentos', [
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