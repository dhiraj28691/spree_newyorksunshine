function Router(routes) {
  var callback = function(){};

  if(!routes.some(yas)) {
   callback = noMatches
  }


  function yas(current_value, index, array) {
    if(current_value.reg_exp.test(window.location.pathname)) {
      callback = current_value.callback;
      // console.log(callback);
      return true;
    } else {
      return false;
    }
  }

  function noMatches() {
    // console.log('no matches');
  }

  // Router.prototype.init = callback

  return callback;
}

