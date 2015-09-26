<?php

function pageAssets() {
	return [
		'scripts' => [],
		'css' => []
	];
}

$assets = [

	'scripts' => [],

	'css' => [

		'/css/bootstrap.min.css',
    '/css/main.css'

	]
];

$assets['home'] = pageAssets();