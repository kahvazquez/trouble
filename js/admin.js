$(function () {

  $('a[data-toggle="collapse"]').on('click', function () {

    location.hash = $(this).attr('href');

  });

  if (location.hash.match(/^#u-/)) {

    $(location.hash).addClass('in');

  }

});
