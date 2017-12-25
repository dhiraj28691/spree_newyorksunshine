//= require util/scrollTo
//= require util/flickity.pkgd.min
function Art() {

  "use strict";

  var flkty, thumbnails_wrapper, thumbnails_wrapper_caution,flkty_tank,thumbnails_wrapper_tank,flkty_chair,flkty_road,flkty_caution,thumbnails_wrapper_chair,thumbnails_wrapper_road;

  Art.prototype.index = function() {

    thumbnails_wrapper = document.querySelector('.thumbnails');
    thumbnails_wrapper_tank = document.querySelector('.thumbnails.tank');
    thumbnails_wrapper_chair = document.querySelector('.thumbnails.chair');
	thumbnails_wrapper_road = document.querySelector('.thumbnails.road');
	thumbnails_wrapper_road = document.querySelector('.thumbnails.caution');


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
      thumbnails_wrapper_tank.querySelector('.current').classList.remove('current');
      thumbnails_wrapper_tank.querySelectorAll('.thumbnail.tank').item(flkty_tank.selectedIndex).classList.add('current');
    });


          flkty_chair = new Flickity('#artbook-chair', {
      cellAlign: 'center',
      cellSelector: '.slide',
      contain: true,
      imagesLoaded: true,
      initialIndex: 2,
      pageDots: false,
      prevNextButtons: false,
      wrapAround: true
    });

    flkty_chair.on( 'cellSelect', function() {
      thumbnails_wrapper_chair.querySelector('.current').classList.remove('current');
      thumbnails_wrapper_chair.querySelectorAll('.thumbnail.chair').item(flkty_chair.selectedIndex).classList.add('current');
    });
	
	          flkty_road = new Flickity('#artbook-road', {
      cellAlign: 'center',
      cellSelector: '.slide',
      contain: true,
      imagesLoaded: true,
      initialIndex: 2,
      pageDots: false,
      prevNextButtons: false,
      wrapAround: true
    });

    flkty_road.on( 'cellSelect', function() {
      thumbnails_wrapper_road.querySelector('.current').classList.remove('current');
      thumbnails_wrapper_road.querySelectorAll('.thumbnail.road').item(flkty_chair.selectedIndex).classList.add('current');
    });
	  
	   flkty_caution = new Flickity('#artbook-caution', {
      cellAlign: 'center',
      cellSelector: '.slide',
      contain: true,
      imagesLoaded: true,
      initialIndex: 2,
      pageDots: false,
      prevNextButtons: false,
      wrapAround: true
    });

    flkty_caution.on( 'cellSelect', function() {
      thumbnails_wrapper_caution.querySelector('.current').classList.remove('current');
      thumbnails_wrapper_caution.querySelectorAll('.thumbnail.caution').item(flkty_caution.selectedIndex).classList.add('current');
    });

    // Slideshow Thumbnails
    bind_thumbnail_events('.thumbnails');
    bind_thumbnail_events_tank('.thumbnails');
	bind_thumbnail_events_chair('.thumbnails');
	bind_thumbnail_events_road('.thumbnails');
	  bind_thumbnail_events_caution('.thumbnails');
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
  
    function bind_thumbnail_events_tank(selector) {

    document.querySelector('.left.capture.tank').addEventListener('click', function(event){
      flkty_tank.previous();
    });

    document.querySelector('.right.capture.tank').addEventListener('click', function(event){
      flkty_tank.next();
    });

    document.querySelector('.thumbnails.tank').addEventListener('click', function(event){
      event.preventDefault();
      flkty_tank.select($(event.target.parentNode).index());
    }, true);

  }

    function bind_thumbnail_events_chair(selector) {

    document.querySelector('.left.capture.chair').addEventListener('click', function(event){
      flkty_chair.previous();
    });

    document.querySelector('.right.capture.chair').addEventListener('click', function(event){
      flkty_chair.next();
    });

    document.querySelector('.thumbnails.chair').addEventListener('click', function(event){
      event.preventDefault();
      flkty_chair.select($(event.target.parentNode).index());
    }, true);

  }
      function bind_thumbnail_events_road(selector) {

    document.querySelector('.left.capture.road').addEventListener('click', function(event){
      flkty_road.previous();
    });

    document.querySelector('.right.capture.road').addEventListener('click', function(event){
      flkty_road.next();
    });

    document.querySelector('.thumbnails.road').addEventListener('click', function(event){
      event.preventDefault();
      flkty_road.select($(event.target.parentNode).index());
    }, true);

  }
	
	     function bind_thumbnail_events_caution(selector) {

    document.querySelector('.left.capture.road').addEventListener('click', function(event){
      flkty_caution.previous();
    });

    document.querySelector('.right.capture.road').addEventListener('click', function(event){
      flkty_caution.next();
    });

    document.querySelector('.thumbnails.road').addEventListener('click', function(event){
      event.preventDefault();
      flkty_caution.select($(event.target.parentNode).index());
    }, true);

  }
}
