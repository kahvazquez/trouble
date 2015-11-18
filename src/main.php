<?php

namespace ksv\trouble;

date_default_timezone_set('America/Sao_Paulo');

require_once __DIR__ . '/../vendor/autoload.php';

require 'Base.php';
require 'User.php';
require 'Config.php';
require 'Db.php';
require 'TemplateEngine.php';

use Klein\Klein;

error_reporting(
  getenv('ENV') === 'production'
    ? 0
    : E_ALL
);

$router = new Klein();

$router->respond(function ($req, $res, $svc, $app) {

  $app->register('config', function () {

    return new Config;

  });

  $app->register('db', function () use ($app) {

    return new Db($app);

  });

  $app->register('user', function () use ($app) {

    return new User($app);

  });

  $app->register('template', function () use ($app) {

    return new TemplateEngine($app);

  });

});

foreach (require('routes.php') as $route) {

  $router->respond($route->path, $route->method, $route->handler);

}

$router->dispatch();
