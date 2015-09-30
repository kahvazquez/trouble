<?php

function pageAssets()
{
  return [
    'js' => [],
    'css' => []
  ];
}

$assets = [

  'googleLoginApiJs' => 'https://apis.google.com/js/platform.js?onload=renderGPlusButton',

  'js' => [
    'https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.min.js',
    'https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/js/bootstrap.min.js',
    '/js/main.js'
  ],

  'css' => [

    '/css/bootstrap.min.css',
    '/css/main.css'

  ]
];
