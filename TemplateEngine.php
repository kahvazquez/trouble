<?php

namespace ksv\trouble;

require_once 'vendor/autoload.php';

use \McKay\Flash;
use \Latte\Engine;

class TemplateEngine
{

  private $engine, $db, $user, $config;

  public function __construct(&$app)
  {

    $this->db = $app->db;
    $this->user = $app->user;
    $this->config = $app->config;
    $this->engine = new Engine;

    $this->engine->addFilter('pad_left', function ($str, $pad = '0', $len = 2) {
      return str_pad($str, $len, $pad, STR_PAD_LEFT);
    });

    $this->engine->setTempDirectory('cache');
  }

  private function getPages()
  {

    $pages = $this->db->
    page->where_equal('menu', 1)->
    find_many();

    return array_map(function ($page) {

      global $baseUrl;

      $page->url = "{$baseUrl}/{$page->id}";
      return $page;

    }, $pages);

  }

  public function render($screen, $data = [])
  {

    require_once 'assets.php';

    global $baseUrl;

    $layoutAssets = empty($assets[$screen]) ? pageAssets() : $assets[$screen];

    $layoutAssets['css'] += $assets['css'];
    $layoutAssets['js'] += $assets['js'];

    $showLoginBt = $screen === 'home' && !$this->user->isLoggedIn();

    if ($showLoginBt) {
      $layoutAssets['js'][] = $assets['googleLoginApiJs'];
    }

    $data = array_merge($layoutAssets, $data);


    $data['messages'] = Flash::all();

    $data['user']  = $this->user;
    $data['baseUrl'] = $baseUrl;

    $data['pathInfo'] = rtrim($_SERVER['PATH_INFO'], '/');

    $data['queryString'] = empty($_SERVER['QUERY_STRING'])
      ? '' : $_SERVER['QUERY_STRING'];

    $data['pages'] = $this->getPages();

    $data['google'] = $this->config->google;

    return $this->engine->renderToString("templates/{$screen}.latte", $data);

  }

}