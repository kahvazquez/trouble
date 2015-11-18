<?php

namespace ksv\trouble;

require 'protege-rota.php';
require 'Equipamentos.php';
require 'Clientes.php';
require 'Tickets.php';
require 'Admin.php';

function makeRoute($path, $method, $callback)
{
  $route = new \stdClass();
  $route->path = $path;
  $route->method = $method;
  $route->handler = $callback;
  return $route;
}

$redirectToAdminInfo = function ($req, $res, $svc, $app) {
  $res->redirect("/admin/grupo/{$req->id}");
};

$redirectToAdminNovo = function ($req, $res, $svc, $app) {
  $res->redirect('/admin/grupo/novo');
};

return [

  makeRoute('GET', '/?', Base::home()),

  makeRoute('GET', '/entrar/?', Base::entrar()),

  makeRoute('POST', '/entrar/?', Base::autenticar()),

  makeRoute('GET', '/sair', Base::sair()),

  makeRoute('GET', '/admin/?', $redirectToAdminNovo),

  makeRoute('GET', '/admin/grupo/[:id]/?', protege(Admin::listar(), 'admin')),

  makeRoute('GET', '/admin/grupo/[:id]/[:tab]/?', protege(Admin::listar(), 'admin')),

  makeRoute('GET', '/admin/grupo/[:id]/[:tab]/[:uid]/?', protege(Admin::listar(), 'admin')),

  makeRoute('POST', '/admin/grupo/[:group]/usuarios/[:id]/?', protege(Admin::salvarUsuario(), 'admin')),

  makeRoute('DELETE', '/admin/grupo/[:group]/usuarios/[:id]/?', protege(Admin::removeUsuario(), 'admin')),

  makeRoute('POST', '/admin/grupo/[:id]/?', protege(Admin::salvarGrupo(), 'admin')),

  makeRoute('DELETE', '/admin/grupo/[:id]', protege(Admin::removeGrupo(), 'admin')),

  makeRoute('POST', '/admin/grupo/[:id]/permissoes/?', protege(Admin::salvarPermissoesGrupo(), 'admin')),

  makeRoute('GET', '/equipamentos?/?', protege(Equipamentos::listar(), 'equipamentos')),

  makeRoute('GET', '/criar/equipamento/?', protege(Equipamentos::cadastrar(), 'criar_equipamento')),

  makeRoute('POST', '/criar/equipamento/?', protege(Equipamentos::salvar(), 'criar_equipamento')),

  makeRoute('GET', '/clientes?/?', protege(Clientes::listar(), 'clientes')),

  makeRoute('GET', '/criar/cliente/?', protege(Clientes::criar(), 'criar_cliente')),

  makeRoute('POST', '/criar/cliente/?', protege(Clientes::salvar(), 'criar_cliente')),

  makeRoute('GET', '/cliente/[:id]/?', protege(Clientes::editar(), 'editar_cliente')),

  makeRoute('POST', '/cliente/[:id]/?', protege(Clientes::salvar(), 'editar_cliente')),

  makeRoute('GET', '/clientes?/relatorio/?', protege(Clientes::xls(), 'clientes')),

  makeRoute('GET', '/tickets?/?', protege(Tickets::listar(), 'tickets')),

  makeRoute('GET', '/tickets?/relatorio/?', protege(Tickets::xls(), 'tickets')),

  makeRoute('GET', '/ticket/[:id]/?', protege(Tickets::editar(), 'editar_ticket')),

  makeRoute('POST', '/ticket/[:id]/?', protege(Tickets::salvar(), 'editar_ticket')),

  makeRoute('GET', '/criar/ticket/?', protege(Tickets::criar(), 'criar_ticket')),

  makeRoute('POST', '/criar/ticket/?', protege(Tickets::salvar(), 'criar_ticket'))
];