<?php

namespace ksv\trouble;

require 'Rotas.php';
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
  Rotas::raiz());

$klein->respond('GET', "{$baseUrl}/equipamentos?/?",
  Rotas::equipamentos());
  
$klein->respond('GET', "{$baseUrl}/tickets?/?", 
  Rotas::tickets());

$klein->dispatch();
