<?php

namespace ksv\trouble;
use \Latte\Engine;

require_once 'vendor/autoload.php';

class TemplateEngine {

	private $engine;
	private $app;
	private $baseUrl;

	public function __construct($baseUrl, &$app) {

		$this->app = $app;
		$this->baseUrl = $baseUrl;
		$this->engine = new Engine;
		$this->engine->setTempDirectory('cache');

	}

	private function getPages() {

		$baseUrl = $this->baseUrl;
		$pages = $this->app->db->
			page->where_equal('menu', 1)->
			find_many();
			
		return array_map(function ($page) use ($baseUrl) {
			$page->url = "{$baseUrl}/{$page->id}";
			return $page;
		}, $pages);
		
	}
	
	public function render($name, $data) {

		require_once 'assets.php';

		$layoutAssets = $assets[$name];

		$layoutAssets['css'] += $assets['css'];
		$layoutAssets['js'] += $assets['js'];

		$data = array_merge($layoutAssets, $data);

		$data['baseUrl'] = $this->baseUrl;
		
		$data['pathInfo'] = rtrim($_SERVER['PATH_INFO'], '/');
		
		$data['queryString'] = $_SERVER['QUERY_STRING'];
		 
		$data['pages'] = $this->getPages();

		return $this->engine->renderToString("templates/$name.latte", $data);

	}

}