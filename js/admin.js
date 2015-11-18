$(function () {

  $('a[data-toggle="collapse"]').on('click', function () {

    location.hash = $(this).attr('href');

  });

  $('[data-unlink]').on('click', function (e) {

    e.preventDefault();

    var pathname = $(this).attr('href') || location.pathname;

    fetch(pathname, {method: 'DELETE', credentials: 'same-origin'})
      .then(function (response) {

        if (!response.ok) {
          return;
        }

        location.href = response.headers.get('X-Location');

      });

  });

  if (location.hash.match(/^#u-/)) {

    $(location.hash).addClass('in');

  }

});
