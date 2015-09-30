<?php

function pageAssets()
{
  return [
    'js' => [],
    'css' => []
  ];
}

$assets = [

  'js' => [

    'https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.min.js',
    'https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/js/bootstrap.min.js'

  ],

  'css' => [

    '/css/bootstrap.min.css',
    '/css/main.css'

  ],

  'login' => [
    'css' => [],
    'js' => [
      '/js/login.js',
      'https://plus.google.com/js/client:plusone.js'
    ]
  ]

];


