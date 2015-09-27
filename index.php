<?php

require 'Db.php';
require 'TemplateEngine.php';
require_once 'vendor/autoload.php';

error_reporting(-1);

$baseUrl = '';

if (strpos($_SERVER["REQUEST_URI"], '/index.php') !== FALSE) {
  $baseUrl .= '/index.php';
}

$klein = new \Klein\Klein();

$klein->respond(function ($req, $res, $svc, $app) {

  $app->register('db', function () {

    return new Db;

  });

  $app->register('template', function () {

  	return new TemplateEngine;

  });

});

$klein->respond('GET', "{$baseUrl}/?", 

	function ($req, $res, $svc, $app) {
	
		$html = $app->template->render('home', [
			'name' => $app->db->test->where_equal('id', 1)->find_one()->name
		]);
		
		$res->body($html)->send();
	
	});

$klein->respond('GET', "{$baseUrl}/equipamentos/?", 

	function ($req, $res, $svc, $app) {
	
		$equipamentos = $app->db->equipamentos->find_many();
		
		$html = $app->template->render('equipamentos', [
			'equipamentos' => $equipamentos
		]);
	
		$res->body($html)->send();

	});
	
$klein->respond('GET', "{$baseUrl}/tickets/?", 

	function ($req, $res, $svc, $app) {
	
		$tickets = $app->db->t_ticket->find_many();
		
		$html = $app->template->render('tickets', [
			'tickets' => $tickets
		]);
	
		$res->body($html)->send();

	});

$klein->dispatch();
