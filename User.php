<?php
/**
 * Created by IntelliJ IDEA.
 * User: christian
 * Date: 9/30/15
 * Time: 1:28 PM
 */

namespace ksv\trouble;


class User
{

  const cookieName = 'TroubleSessionId';
  private $db;
  private $user;
  private $session;

  function __construct(&$app)
  {
    session_start();
    $this->db = $app->db;
    $this->config = $app->config;
    $this->loadSession();
  }

  private function getCookie()
  {
    return empty($_COOKIE[User::cookieName]) ? NULL : $_COOKIE[User::cookieName];
  }

  private function setCookie()
  {

    if (!$this->session) {
      setcookie(User::cookieName, '', 1, '/');
    } else {
      setcookie(User::cookieName, $this->session->id, strtotime('+15 days'), '/');
    }

  }

  private function loadUser()
  {
    $this->user = $this->db->user->find_one($this->session->user);
  }

  private function loadSession()
  {

    if (!$this->getCookie()) {

      return;
    }

    $this->session = $this->db->session->find_one(
      $this->getCookie()
    );

    if (!$this->session) {
      return;
    }

    $expiration = strtotime($this->session->expiration);

    if ($expiration < time()) {
      return;
    }


    if ($expiration < strtotime('next hour')) {
      $this->session->expiration = date('Y-m-d H:i:s', strtotime('+1 day'));
      $this->session->save();
    }

    $this->loadUser();
  }

  public function isLoggedIn()
  {
    return isset($this->user);
  }

  public function authorizeGoogleUser($access_code)
  {

    $client = new \Google_Client();
    $google = $this->config->google;

    $client->setApplicationName('Portal da Rede');
    $client->setClientId($google->clientId);
    $client->setClientSecret($google->secret);
    $client->setRedirectUri('postmessage');
    $client->addScope('https://www.googleapis.com/auth/userinfo.profile');
    $client->addScope('https://www.googleapis.com/auth/userinfo.email');

    $client->authenticate($access_code);
    $json_token = $client->getAccessToken();

    $client->setAccessToken($json_token);

    $plus = new \Google_Service_Plus($client);
    $user = $plus->people->get('me');

    if (!$user->emails || !is_array($user->emails)) {
      return;
    }

    $email = $user->emails[0]['value'];
    $user_email = $this->db->user_email->find_one($email);

    if (!$user_email) {
      return;
    }

    $this->login($user_email->user);

  }

  public function login($user)
  {

    $this->session = $this->db->session->create();

    $this->session->id = strtoupper(md5(uniqid(mt_rand(), true)));
    $this->session->user = $user;
    $this->session->expiration = date('Y-m-d H:i:s', strtotime('+1 day'));
    $this->session->save();

    $this->loadUser();
    $this->setCookie();
  }

  public function logout()
  {

    if ($this->session) {

      $this->session->delete();

    }

    $this->session = NULL;
    $this->user = NULL;
    $this->setCookie();

  }
}