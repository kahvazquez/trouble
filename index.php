<?php

require 'Db.php';
require 'TemplateEngine.php';
require_once 'vendor/autoload.php';

error_reporting(-1);

$klein = new \Klein\Klein();

$klein->respond(function ($request, $response, $service, $app) {

  $app->register('db', function () {

    return new Db;

  });

  $app->register('template', function () {

  	return new TemplateEngine;

  });

});

$klein->respond('GET', '/', function ($req, $res, $service, $app) {

	$res->body(

		$app->template->render('home', [
			'name' => $app->db->test->where_equal('id', 1)->find_one()->name
		])

	);

	$res->send();

});

$klein->dispatch();
