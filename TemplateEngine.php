<?php

namespace ksv\trouble;
use \Latte\Engine;

require_once 'vendor/autoload.php';

class TemplateEngine {

	private $engine;

	public function __construct() {

		$this->engine = new Engine;
		$this->engine->setTempDirectory('cache');

	}

	public function render($name, $data) {

		require_once 'assets.php';

		$layoutAssets = $assets[$name];

		$layoutAssets['css'] += $assets['css'];
		$layoutAssets['js'] += $assets['js'];

		$data = array_merge($layoutAssets, $data);

		return $this->engine->renderToString("templates/$name.latte", $data);

	}

}