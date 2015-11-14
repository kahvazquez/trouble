<?php
/**
 * Created by IntelliJ IDEA.
 * User: christian
 * Date: 9/30/15
 * Time: 2:09 PM
 */

namespace ksv\trouble;


class Config
{
  private $config;

  function __construct()
  {
    $this->config = parse_ini_file('config.ini', true);
  }

  function __get($name)
  {
    return (object)$this->config[$name];
  }
}