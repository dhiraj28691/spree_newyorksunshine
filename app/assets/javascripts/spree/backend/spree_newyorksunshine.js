//= require cocoon
//= require_tree .
//= require util/router.js

var feed = new Feed(),
  slides = new Slides(),
  posts = new Posts();

var routes = [];
routes.push({ reg_exp: /^\/admin\/feed_items\/new$/, callback: feed.new });
routes.push({ reg_exp: /^\/admin\/feed_items\/([\w-]+)\/edit$/, callback: feed.edit });

routes.push({ reg_exp: /^\/admin\/lookbooks\/([\w-]+)\/slides$/, callback: slides.index });
routes.push({ reg_exp: /^\/admin\/lookbooks\/([\w-]+)\/slides\/new$/, callback: slides.form });
routes.push({ reg_exp: /^\/admin\/lookbooks\/([\w-]+)\/slides\/([\w-]+)\/edit$/, callback: slides.form });

routes.push({ reg_exp: /^\/admin\/posts\/new$/, callback: posts.form });
routes.push({ reg_exp: /^\/admin\/posts\/([\w-]+)\/edit$/, callback: posts.form });


var callback = new Router(routes);

// route.init();
document.addEventListener('DOMContentLoaded', callback);
