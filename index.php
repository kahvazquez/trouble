<?php

namespace ksv\trouble;

$baseUrl = '';

if (strpos($_SERVER["REQUEST_URI"], '/index.php') !== FALSE) {
  $baseUrl .= '/index.php';
}

require 'Rotas.php';
require 'Equipamentos.php';
require 'Tickets.php';
require 'Db.php';
require 'TemplateEngine.php';
require_once 'vendor/autoload.php';

error_reporting(0);

$klein = new \Klein\Klein();
$klein->respond(function ($req, $res, $svc, $app) {

  $app->register('db', function () {

    return new Db;

  });

  $app->register('template', function () use ($app) {

  	return new TemplateEngine($app);

  });

});

$klein->respond('GET', "{$baseUrl}/?",
  Rotas::raiz());

$klein->respond('GET', "{$baseUrl}/equipamentos?/?",
  Equipamentos::lista());

$klein->respond('GET', "{$baseUrl}/tickets?/?",
  Tickets::lista());

$klein->respond('GET', "{$baseUrl}/tickets?/relatorio/?",
  Tickets::xls());

$klein->dispatch();
