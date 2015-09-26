<?php

require 'Db.php';
require_once __DIR__ . '/vendor/autoload.php';

$config = parse_ini_file('config.ini', true);
$klein = new \Klein\Klein();

$klein->respond(function ($request, $response, $service, $app) use ($config) {
  
  $app->register('db', function() {

    return new Db;

  });

});

$klein->respond('GET', '/', function ($req, $res, $service, $app) {

	$res->body(

		$app->db->
			test->where_equal('id', 1)->
			find_one()->name

	)->send();

});

$klein->dispatch();
