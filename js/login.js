(function (global) {

  global.onSignInCallback = function (authResult) {

    if (!authResult.code) {
      return;
    }

    var form = document.getElementById('googleLoginForm');

    form.elements.token.value = authResult.code;
    form.submit();

  };

}(window));