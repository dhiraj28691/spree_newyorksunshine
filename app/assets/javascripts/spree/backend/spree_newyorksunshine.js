//= require cocoon
//= require_tree .
//= require util/router.js

var feed = new Feed(),
  slides = new Slides(),
  posts = new Posts();


var route = new Router([
  { reg_exp: /^\/admin\/feed_items\/new$/, callback: feed.new },
  { reg_exp: /^\/admin\/feed_items\/([\w-]+)\/edit$/, callback: feed.edit },
  { reg_exp: /^\/admin\/lookbooks\/([\w-]+)\/slides\/new$/, callback: slides.form },
  { reg_exp: /^\/admin\/lookbooks\/([\w-]+)\/slides\/([\w-]+)\/edit$/, callback: slides.form },
  { reg_exp: /^\/admin\/posts\/new$/, callback: posts.form },
  { reg_exp: /^\/admin\/posts\/([\w-]+)\/edit$/, callback: posts.form },
]);

// route.init();
document.addEventListener('DOMContentLoaded', route);
