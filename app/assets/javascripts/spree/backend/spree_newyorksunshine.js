//= require cocoon
//= require_tree .
//= require util/router.js

var slides = new Slides();

var route = new Router([
  { reg_exp: /^\/admin\/lookbooks\/([\w-]+)\/slides\/new$/, callback: slides.form },
  { reg_exp: /^\/admin\/lookbooks\/([\w-]+)\/slides\/([\w-]+)\/edit$/, callback: slides.form }
]);

// route.init();
document.addEventListener('DOMContentLoaded', route);
