Modernizr.preserve3d = (function () {
    var element = document.createElement('link'),
    body = document.getElementsByTagName('HEAD')[0],
    propertys = {
         'webkitTransformStyle':'-webkit-transform-style',
          'MozTransformStyle':'-moz-transform-style',
           'msTransformStyle':'-ms-transform-style',
           'transformStyle':'transform-style'
    };

    body.insertBefore(element, null);
    for (var i in propertys) {
        if (element.style[i] !== undefined) {
            element.style[i] = "preserve-3d";
        }
    }
     //ie7,ie8 doesnt support getComputedStyle
     //so this is the implementation
    if(!window.getComputedStyle) {
        window.getComputedStyle = function(el, pseudo) {
            this.el = el;
            this.getPropertyValue = function(prop) {
                var re = /(\-([a-z]){1})/g;
                if (prop == 'float') prop = 'styleFloat';
                if (re.test(prop)) {
                    prop = prop.replace(re, function () {
                        return arguments[2].toUpperCase();
                    });
                }
                return el.currentStyle[prop] ? el.currentStyle[prop] : null;
            };
            return this;
        };
    }

    var st = window.getComputedStyle(element, null),
        transform = st.getPropertyValue("-webkit-transform-style") ||
        st.getPropertyValue("-moz-transform-style") ||
        st.getPropertyValue("-ms-transform-style") ||
        st.getPropertyValue("transform-style");

    if(transform!=='preserve-3d'){
       element.parentNode.removeChild(element);
       return false;
    }
    element.parentNode.removeChild(element);
    return true;
}).call();