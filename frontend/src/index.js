import "./style.scss"
import "./nav.scss"
import "./post.scss"
const url = new URL(location.href);

if (url.pathname === "/") {
  require('./main.js');
} else if (url.pathname === "/posts/*") {
  require('./post.js');
}

$(function () {
  $('#navToggle').click(function () {
    $('header').toggleClass('openNav');
  });
});