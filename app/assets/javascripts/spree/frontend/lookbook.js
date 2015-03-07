//= require util/flickity.pkgd.min

function Lookbooks() {
  "use strict";

  var flkty;

  Lookbooks.prototype.show = function(){



    // Slideshow
    flkty = new Flickity('#lookbook', {
      cellAlign: 'center',
      cellSelector: '.slide',
      contain: true,
      imagesLoaded: true,
      // initialIndex: 2,
      pageDots: false,
      prevNextButtons: false,
      wrapAround: true
    });


    var thumbnails_wrapper = document.querySelector('#thumbnails');
    flkty.on( 'cellSelect', function() {
      thumbnails_wrapper.querySelector('.current').classList.remove('current');
      thumbnails_wrapper.querySelectorAll('.thumbnail').item(flkty.selectedIndex).classList.add('current');
    });




   document.querySelector('.left.capture').addEventListener('click', function(event){
      flkty.previous();
    });

    document.querySelector('.right.capture').addEventListener('click', function(event){
      flkty.next();
    });

    document.querySelector('#thumbnails').addEventListener('click', function(event){
      event.preventDefault();
      flkty.select($(event.target.parentNode).index());
    }, true);




  };
}