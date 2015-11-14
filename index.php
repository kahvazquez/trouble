<?php

namespace ksv\trouble;

date_default_timezone_set('America/Sao_Paulo');
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
require 'protege-rota.php';
require 'TemplateEngine.php';
require_once 'vendor/autoload.php';

error_reporting(E_ALL);

$klein = new \Klein\Klein();
$klein->respond(function ($req, $res, $svc, $app) {

  $app->register('config', function () {

    return new Config;

  });

  $app->register('db', function () use (&$app) {

    return new Db($app);

  });

  $app->register('user', function () use (&$app) {

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
  protege(Equipamentos::listar()));

$klein->respond('GET', "{$baseUrl}/criar/equipamento/?",
  protege(Equipamentos::cadastrar()));

$klein->respond('POST', "{$baseUrl}/criar/equipamento/?",
  protege(Equipamentos::salvar()));

$klein->respond('GET', "{$baseUrl}/clientes?/?",
  protege(Clientes::listar()));

$klein->respond('GET', "{$baseUrl}/criar/cliente/?",
  protege(Clientes::criar()));

$klein->respond('GET', "{$baseUrl}/cliente/[:id]/?",
  protege(Clientes::editar()));

$klein->respond('POST', "{$baseUrl}/criar/cliente/?",
  protege(Clientes::salvar()));

$klein->respond('POST', "{$baseUrl}/cliente/[:id]/?",
  protege(Clientes::salvar()));

$klein->respond('GET', "{$baseUrl}/tickets?/?",
  protege(Tickets::listar()));

$klein->respond('GET', "{$baseUrl}/tickets?/relatorio/?",
  protege(Tickets::xls()));

$klein->respond('GET', "{$baseUrl}/ticket/[:id]/?",
  protege(Tickets::editar()));

$klein->respond('GET', "{$baseUrl}/criar/ticket/?",
  protege(Tickets::criar()));

$klein->respond('POST', "{$baseUrl}/criar/ticket/?",
  protege(Tickets::salvar()));

$klein->respond('POST', "{$baseUrl}/ticket/[:id]/?",
  protege(Tickets::salvar()));

$klein->dispatch();
