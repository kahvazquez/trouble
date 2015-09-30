(function (global) {

  var gLoginButtonId = 'google-signin-button';

  global.renderGPlusButton = function () {

    gapi.signin2.render(gLoginButtonId, {
      scope: 'https://www.googleapis.com/auth/plus.login',
      width: 200,
      height: 50,
      longtitle: true,
      theme: 'dark',
      onsuccess: function (googleUser) {

        var form = document.getElementById('googleLoginForm');
        form.elements.token.value = googleUser.getAuthResponse().id_token;
        form.submit();

      }
    });

  };

}(window));