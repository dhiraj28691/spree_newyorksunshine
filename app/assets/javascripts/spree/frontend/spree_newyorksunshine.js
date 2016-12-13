// require jquery
// require jquery_ujs
//= require bootstrap-sprockets
//= require jquery.validate/jquery.validate.min
//= require spree
//= require spree/frontend/cart
//= require spree/frontend/checkout
//= require spree/frontend/product
//= require spree/frontend/home



// Placeholder manifest file.
// the installer will append this file to the app vendored assets here: vendor/assets/javascripts/spree/frontend/all.js'

//= require_tree .
//= require util/router
// var feed = new Feed(),
//   slides = new Slides(),
//   posts = new Posts();

var art = new Art(),
  lookbooks = new Lookbooks();




var routes = [];
// routes.push({ reg_exp: /^\/admin\/feed_items\/new$/, callback: feed.new });
// routes.push({ reg_exp: /^\/admin\/feed_items\/([\w-]+)\/edit$/, callback: feed.edit });
// routes.push({ reg_exp: /^\/admin\/lookbooks\/([\w-]+)\/slides\/new$/, callback: slides.form });
// routes.push({ reg_exp: /^\/admin\/lookbooks\/([\w-]+)\/slides\/([\w-]+)\/edit$/, callback: slides.form });
// routes.push({ reg_exp: /^\/admin\/posts\/new$/, callback: posts.form });
// routes.push({ reg_exp: /^\/admin\/posts\/([\w-]+)\/edit$/, callback: posts.form });
routes.push({ reg_exp: /^\/art$/, callback: art.index })
routes.push({ reg_exp: /^\/lookbooks\/([\w-]+)$/, callback: lookbooks.show });


var callback = new Router(routes);

// route.init();
document.addEventListener('DOMContentLoaded', callback);
