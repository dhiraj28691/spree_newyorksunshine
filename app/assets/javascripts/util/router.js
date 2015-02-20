function Router(routes) {
  var callback = function(){};

  if(!routes.some(yas)) {
   callback = function() { console.log('no matches'); }
  }


  function yas(element) {
    if(element.reg_exp.test(window.location.pathname)) {
      callback = element.callback;
      // console.log(callback);
      return true;
    } else {
      return false;
    }
  }

  // Router.prototype.init = callback

  return callback;
}

