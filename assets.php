<?php

function pageAssets() {
	return [
		'js' => [],
		'css' => []
	];
}

$assets = [

	'js' => [],

	'css' => [

		'/css/bootstrap.min.css',
    '/css/main.css'

	]
];

$assets['home'] = pageAssets();