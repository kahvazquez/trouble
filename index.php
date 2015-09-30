<?php

namespace ksv\trouble;

$baseUrl = '';

if (strpos($_SERVER["REQUEST_URI"], '/index.php') !== FALSE) {
  $baseUrl .= '/index.php';
}

require 'Base.php';
require 'Equipamentos.php';
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

$klein->respond('POST', "{$baseUrl}/entrar/google/?",
  Base::loginGoogle());

$klein->respond('GET', "{$baseUrl}/sair",
  Base::logout());

$klein->respond('GET', "{$baseUrl}/equipamentos?/?",
  Equipamentos::lista());

$klein->respond('GET', "{$baseUrl}/tickets?/?",
  Tickets::lista());

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
