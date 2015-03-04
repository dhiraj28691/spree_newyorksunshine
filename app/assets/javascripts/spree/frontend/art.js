//= require util/scrollTo

function HeroVideo(selector) {
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




document.addEventListener("DOMContentLoaded", function() {
  if(document.querySelector('#video-container') !== null) {

    var hero_video = new HeroVideo('#video-container');

    var flkty = new Flickity('#artbook', {
      cellAlign: 'center',
      cellSelector: '.slide',
      contain: true,
      imagesLoaded: true,
      initialIndex: 2,
      pageDots: false,
      prevNextButtons: false,
      wrapAround: true
    });

    var thumbnails_wrapper = document.querySelector('.thumbnails');

    document.querySelector('.left.capture').addEventListener('click', function(event){
      flkty.previous();
    });

    document.querySelector('.right.capture').addEventListener('click', function(event){
      flkty.next();
    });

    document.querySelector('.thumbnails').addEventListener('click', function(event){
      event.preventDefault();
      console.log($(event.target.parentNode).index());
      var slide_index = $(event.target.parentNode).index();

      flkty.select(slide_index);


    }, true);

    flkty.on( 'cellSelect', function() {
      console.log( 'Flickity select ' + flkty.selectedIndex );

      try {
        thumbnails_wrapper.querySelector('.current').classList.remove('current');
      } catch(e) {
        console.log(e);
      }

      console.log({
        'thumbnails_wrapper': thumbnails_wrapper,
        'thumbnails_wrapper.childNodes': thumbnails_wrapper.childNodes,
        'thumbnails_wrapper.childNodes[flkty.selectedIndex]': thumbnails_wrapper.querySelectorAll('.thumbnail').item(flkty.selectedIndex)
      });

      thumbnails_wrapper.querySelectorAll('.thumbnail').item(flkty.selectedIndex).classList.add('current');

    });


  }

});