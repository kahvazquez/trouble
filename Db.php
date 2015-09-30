<?php

namespace ksv\trouble;

use \ORM;
use \PDO;

require_once 'vendor/autoload.php';

class Db
{

  public function __construct(&$app)
  {

    $db = $app->config->db;

    ORM::configure("mysql:host={$db->host};dbname={$db->name}");
    ORM::configure('username', $db->username);
    ORM::configure('password', $db->password);
    ORM::configure('driver_options', [
      PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'
    ]);

  }

  public function __get($name)
  {
    return ORM::for_table($name);
  }

}