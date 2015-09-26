<?php

require_once 'vendor/autoload.php';

$config = parse_ini_file('config.ini', true);

$db = (object) $config['db'];

ORM::configure("mysql:host={$db->host};dbname={$db->name}");
ORM::configure('username', $db->username);
ORM::configure('password', $db->password);
ORM::configure('error_mode', PDO::ERRMODE_WARNING);

class Db {
	
	public function __get($name) {
		return ORM::for_table($name);
	}

}