import "./style.scss"
import "./nav.scss"
import "./post.scss"
import "./category.scss"
import "./devise.scss"

import Rails from '@rails/ujs';
Rails.start();

const url = new URL(location.href);

if (url.pathname === "/") {
  require('./main.js');
} else if (url.pathname.match("post")) {
  require('./post.js');
}

$(function () {
  $('#navToggle').click(function () {
    $('header').toggleClass('openNav');
  });
});

$(function () {
  if ($('#stopBtn').length) {
    $('#submitBtn').prop('disabled', true);
  } else {
  }
});