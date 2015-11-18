<?php

namespace ksv\trouble;

use \McKay\Flash;
use \Latte\Engine;

class TemplateEngine
{

  private $engine, $db, $user, $config;

  function __construct($app)
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

    $pages = $this->db->page
      ->select_many('id', 'name', 'permission')
      ->where_equal('menu', 1)
      ->find_many();

    $user = $this->user;

    $pages = array_filter($pages, function ($p) use ($user) {

      return $user->hasPermission($p->permission);

    });

    return array_map(function ($page) {

      $page->url = "/{$page->id}";
      return $page;

    }, $pages);

  }

  function render($screen, $data = [])
  {

    require_once 'assets.php';

    $layoutAssets = empty($assets[$screen]) ? pageAssets() : $assets[$screen];

    $layoutAssets['css'] = array_merge($assets['css'], isset($layoutAssets['css']) ? $layoutAssets['css'] : []);
    $layoutAssets['js'] = array_merge($assets['js'], isset($layoutAssets['js']) ? $layoutAssets['js'] : []);

    $data = array_merge($layoutAssets, $data);

    $data['messages'] = Flash::all();
    Flash::clear();

    $data['user'] = $this->user;

    $data['pathInfo'] = rtrim($_SERVER['PATH_INFO'], '/');

    $data['queryString'] = empty($_SERVER['QUERY_STRING'])
      ? '' : $_SERVER['QUERY_STRING'];

    if ($this->user->isLoggedIn()) {

      $data['pages'] = $this->getPages();
      $data['pages'][] = (object)[
        'url' => '/sair',
        'name' => 'Logout'
      ];

    } else {

      $data['pages'] = [(object)[
        'url' => '/entrar',
        'name' => 'Login'
      ]];

    }

    $data['google'] = $this->config->google;

    return $this->engine->renderToString("templates/{$screen}.latte", $data);

  }

}