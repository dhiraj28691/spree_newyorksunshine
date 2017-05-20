//= require util/scrollTo
//= require util/flickity.pkgd.min

function Art() {

  "use strict";

  var flkty, thumbnails_wrapper, flkty_tank;

  Art.prototype.index = function() {

    thumbnails_wrapper = document.querySelector('.thumbnails');



    // Hero Video
    init_hero_video('#video-container');

    // Slideshow
    flkty = new Flickity('#artbook', {
      cellAlign: 'center',
      cellSelector: '.slide',
      contain: true,
      imagesLoaded: true,
      initialIndex: 2,
      pageDots: false,
      prevNextButtons: false,
      wrapAround: true
    });

    flkty.on( 'cellSelect', function() {
      thumbnails_wrapper.querySelector('.current').classList.remove('current');
      thumbnails_wrapper.querySelectorAll('.thumbnail').item(flkty.selectedIndex).classList.add('current');
    });
    
        flkty_tank = new Flickity('#artbook-tank', {
      cellAlign: 'center',
      cellSelector: '.slide',
      contain: true,
      imagesLoaded: true,
      initialIndex: 2,
      pageDots: false,
      prevNextButtons: false,
      wrapAround: true
    });

    flkty_tank.on( 'cellSelect', function() {
      thumbnails_wrapper.querySelector('.current').classList.remove('current');
      thumbnails_wrapper.querySelectorAll('.thumbnail').item(flkty.selectedIndex).classList.add('current');
    });

    // Slideshow Thumbnails
    bind_thumbnail_events('.thumbnails');
  }

  // Private functions
  function init_hero_video(selector) {
    "use strict";
    var that = this;

    var video_container_el = document.querySelector(selector),
      video_el = video_container_el.querySelector('video'),
      text_container = video_container_el.querySelector('.description'),

    top_area_el = video_container_el.querySelector('.top-area'),
    bottom_area_el = video_container_el.querySelector('.bottom-area');

    top_area_el.addEventListener('click', toggleState);

    bottom_area_el.addEventListener('click', scrollToSlideshow);


    var is_playing = true;


    function toggleState(event) {
      event.preventDefault()

      if(is_playing === true) {

        video_el.pause();

        video_el.setAttribute('data-state', 'paused');
        document.body.classList.add('dark');

        is_playing = false


      } else {

        video_el.play();

        video_el.setAttribute('data-state', 'playing');
        document.body.classList.remove('dark');

        is_playing = true;
      }
    };

    function scrollToSlideshow(event) {
      event.preventDefault()

      video_el.play();
      video_el.setAttribute('data-state', 'playing');
      document.body.classList.remove('dark');

      is_playing = true;

      scrollTo(window.innerHeight - document.querySelector('.main-nav').clientHeight + 65, 800);
    };
  }

  function bind_thumbnail_events(selector) {

    document.querySelector('.left.capture').addEventListener('click', function(event){
      flkty.previous();
    });

    document.querySelector('.right.capture').addEventListener('click', function(event){
      flkty.next();
    });

    document.querySelector('.thumbnails').addEventListener('click', function(event){
      event.preventDefault();
      flkty.select($(event.target.parentNode).index());
    }, true);

  }
}

