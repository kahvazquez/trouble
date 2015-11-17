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
require 'Admin.php';
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

$klein->respond('GET', "$baseUrl/admin/?",
  function ($req, $res, $svc, $app) {
    $res->redirect('/admin/grupo/novo');
  });

$klein->respond('GET', "$baseUrl/admin/grupo/[:id]/?",
  function ($req, $res, $svc, $app) {
    $res->redirect("/admin/grupo/{$req->id}/info");
  });

$klein->respond('GET', "$baseUrl/admin/grupo/[:id]/[:tab]/?",
  protege(Admin::listar(), 'admin'));

$klein->respond(
  'GET',
  "{$baseUrl}/equipamentos?/?",
  protege(Equipamentos::listar(), 'equipamentos')
);

$klein->respond(
  'GET',
  "{$baseUrl}/criar/equipamento/?",
  protege(Equipamentos::cadastrar(), 'criar_equipamento')
);

$klein->respond(
  'POST',
  "{$baseUrl}/criar/equipamento/?",
  protege(Equipamentos::salvar(), 'criar_equipamento')
);

$klein->respond(
  'GET',
  "{$baseUrl}/clientes?/?",
  protege(Clientes::listar(), 'clientes')
);

$klein->respond(
  'GET',
  "{$baseUrl}/criar/cliente/?",
  protege(Clientes::criar(), 'criar_cliente')
);

$klein->respond(
  'POST',
  "{$baseUrl}/criar/cliente/?",
  protege(Clientes::salvar(), 'criar_cliente')
);

$klein->respond(
  'GET',
  "{$baseUrl}/cliente/[:id]/?",
  protege(Clientes::editar(), 'editar_cliente')
);

$klein->respond(
  'POST',
  "{$baseUrl}/cliente/[:id]/?",
  protege(Clientes::salvar(), 'editar_cliente')
);

$klein->respond(
  'GET',
  "{$baseUrl}/clientes?/relatorio/?",
  protege(Clientes::xls(), 'clientes')
);

$klein->respond(
  'GET',
  "{$baseUrl}/tickets?/?",
  protege(Tickets::listar(), 'tickets')
);

$klein->respond(
  'GET',
  "{$baseUrl}/tickets?/relatorio/?",
  protege(Tickets::xls(), 'tickets')
);

$klein->respond(
  'GET',
  "{$baseUrl}/ticket/[:id]/?",
  protege(Tickets::editar(), 'editar_ticket')
);

$klein->respond(
  'POST',
  "{$baseUrl}/ticket/[:id]/?",
  protege(Tickets::salvar(), 'editar_ticket')
);

$klein->respond(
  'GET',
  "{$baseUrl}/criar/ticket/?",
  protege(Tickets::criar(), 'criar_ticket')
);

$klein->respond(
  'POST',
  "{$baseUrl}/criar/ticket/?",
  protege(Tickets::salvar(), 'criar_ticket')
);

$klein->dispatch();
