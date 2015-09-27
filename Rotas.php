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
	
}