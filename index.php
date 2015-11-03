<?php

namespace ksv\trouble;

$baseUrl = '';

if (strpos($_SERVER["REQUEST_URI"], '/index.php') !== FALSE) {
  $baseUrl .= '/index.php';
}

require 'Base.php';
require 'Equipamentos.php';
require 'Clientes.php';
require 'User.php';
require 'Config.php';
require 'Tickets.php';
require 'Db.php';
require 'TemplateEngine.php';
require_once 'vendor/autoload.php';

error_reporting(0);

$klein = new \Klein\Klein();
$klein->respond(function ($req, $res, $svc, $app) {

  $app->register('config', function () {

    return new Config;

  });

  $app->register('db', function () use (&$app) {

    return new Db($app);

  });

  $app->register('user', function () use(&$app) {

    return new User($app);

  });

  $app->register('template', function () use (&$app) {

    return new TemplateEngine($app);

  });

});

$klein->respond('GET', "{$baseUrl}/?",
  Base::home());

$klein->respond('GET', "{$baseUrl}/entrar/?",
  Base::entrar());

$klein->respond('POST', "{$baseUrl}/entrar/?",
  Base::autenticar());

$klein->respond('GET', "{$baseUrl}/sair",
  Base::sair());

$klein->respond('GET', "{$baseUrl}/equipamentos?/?",
  Equipamentos::listar());

$klein->respond('GET', "{$baseUrl}/cadastrar/?",
  Equipamentos::cadastrar());

$klein->respond('GET', "{$baseUrl}/clientes?/?",
  Clientes::listar());

$klein->respond('GET', "{$baseUrl}/criar/clientes/?",
  Clientes::criar());

$klein->respond('GET', "{$baseUrl}/tickets?/?",
  Tickets::listar());

$klein->respond('GET', "{$baseUrl}/tickets?/relatorio/?",
  Tickets::xls());

$klein->respond('GET', "{$baseUrl}/ticket/[:id]/?",
  Tickets::editar());

$klein->respond('GET', "{$baseUrl}/criar/ticket/?",
  Tickets::criar());

$klein->respond('POST', "{$baseUrl}/criar/ticket/?",
  Tickets::salvar());

$klein->respond('POST', "{$baseUrl}/ticket/[:id]/?",
  Tickets::salvar());

$klein->dispatch();
