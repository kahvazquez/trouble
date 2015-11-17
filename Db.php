<?php

namespace ksv\trouble;

use \ORM;
use \PDO;

require_once 'vendor/autoload.php';

class Db
{

  function __construct(&$app)
  {

    $db = $app->config->db;

    ORM::configure("mysql:host={$db->host};dbname={$db->name}");
    ORM::configure('username', $db->username);
    ORM::configure('password', $db->password);

    ORM::configure('logging', getenv('LOG_QUERIES') === 'yes');
    ORM::configure('logger', function($log_string, $query_time) {
      error_log($log_string . ' in ' . $query_time);
    });

    ORM::configure('driver_options', [
      PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'
    ]);

  }

  function __get($name)
  {
    return ORM::for_table($name);
  }

}