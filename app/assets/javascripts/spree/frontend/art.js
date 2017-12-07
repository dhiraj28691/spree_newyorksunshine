//= require util/scrollTo
//= require util/flickity.pkgd.min

var menu01 = new MobileMenu;

menu01.init();

function MobileMenu(){
	
	// set variables
	var $body = $('body');
	var $btnMenu = $('.btn-menu');
	// get the nav li elements from the 
	// desktop menu
	var navLiHTML = $('header nav ul').html();
	// create the mobile menu from the desktop li elements...
	var mobileNavHTML = $('<nav class="mobile-nav"><ul>' + navLiHTML  + '</ul></nav>');
	
	// Add the mobile menu to the main element...
	$('main').prepend(mobileNavHTML);
	
	// select the newly created mobile menu
	var $mobileNav = $('.mobile-nav');
	
	// select all the "a" links that have a 
	// sub menu
	var $dd = $('.mobile-nav .dd');
	
	// initialization method for the
	// MobileMenu class	
	this.init = function(){
		
		// measure height of menu in open state
		// then close the menu
		$body.addClass('show');
		var mobileNavOriginalHeight = $mobileNav.height();
		var mobileNavHeight = $mobileNav.height();
		$body.removeClass('show');
		
		// Open all the menus and the sub menus 
		// and measure the height of each
		// sub menu then close all the 
		// sub menus
		$body.addClass('show');
		$('.mobile-nav .dd').addClass('dd-show');
		// Loop through the sub menus add get the height
		// of the sub menus and set a data attribute to 
		// that height
		$('.mobile-nav .dd').each(function(){
			var theHeight = $(this).next().height();
			$(this).next().attr('data-height', theHeight);	
		}); // end each...
		// Close the menu and the sub menus
		$body.removeClass('show');
		$('.mobile-nav .dd').removeClass('dd-show');

		// Click event handler for the mobile menu
		$btnMenu.click(function(){
			// check if body element has the
			// class show
			if($body.hasClass('show')){
				// menu is open...
				// remove any heights set on the mobile nav
				$mobileNav.removeAttr('style');
				// remove the "show" class from the body
				// element
				$body.removeClass('show');
				// remove any heights set on the sub
				// menus
				$dd.next().removeAttr('style');
				// remove the "dd-show" class from the
				// links that have sub menu items 				
				$dd.removeClass('dd-show');	
			}else{
				// menu is closed...
				// set height of mobile menu to the open height
				$mobileNav.css('height', mobileNavOriginalHeight);
				// add the class "show" to the body element
				$body.addClass('show');	
			} // end if menu is open...
				
		}); // end mobile menu click event handler
				
		$dd.click(function(){
			// check if this sub menu link
			// is open
			if($(this).hasClass('dd-show')){
				// this sub menu is open...
				// get current height of mobile menu
				mobileNavHeight = $mobileNav.outerHeight();
				// set new height of mobile menu by taking the
				// existing height of the mobile menu and
				// subtracting the height of the sub menu that
				// was clicked on...
				$mobileNav.css('height', (mobileNavHeight - $(this).next().data('height')));
				// remove the height style that was applied to this
				// sub menu
				$(this).next().removeAttr('style');
				// remove the "dd-show" class from the sub menu link
				// that was clicked on
				$(this).removeClass('dd-show');	
			}else{
				// this sub menu is closed
				// remove any height styles applied
				// to any sub menus
				$dd.next().removeAttr('style');
				// remove the "dd-show" class from
				// any sub menu link elements
				$dd.removeClass('dd-show');
				// set the new height of the 
				// mobile menu by adding the
				// height of mobile navs orginal 
				// open state height to the height
				// of the sub menu item that was
				// clicked on
				$mobileNav.css('height', (mobileNavOriginalHeight + $(this).next().data('height')));
				// set the height of the sub menu that
				// was clicked on
				$(this).next().css('height', $(this).next().data('height'))
				// add the "dd-show" class to
				// sub menu link that was clicked on...
				$(this).addClass('dd-show');
			} // end if sub menu is open	
		}) // end sub menu click event handler

	} // end init()
	
} // end MobileMenu Constructor


function Art() {

  "use strict";

  var flkty, thumbnails_wrapper, flkty_tank,thumbnails_wrapper_tank,flkty_chair,flkty_road,thumbnails_wrapper_chair,thumbnails_wrapper_road;

  Art.prototype.index = function() {

    thumbnails_wrapper = document.querySelector('.thumbnails');
    thumbnails_wrapper_tank = document.querySelector('.thumbnails.tank');
    thumbnails_wrapper_chair = document.querySelector('.thumbnails.chair');
	thumbnails_wrapper_road = document.querySelector('.thumbnails.road');



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

    flkty_chair.on( 'cellSelect', function() {
      thumbnails_wrapper_road.querySelector('.current').classList.remove('current');
      thumbnails_wrapper_road.querySelectorAll('.thumbnail.road').item(flkty_chair.selectedIndex).classList.add('current');
    });

    // Slideshow Thumbnails
    bind_thumbnail_events('.thumbnails');
    bind_thumbnail_events_tank('.thumbnails');
	bind_thumbnail_events_chair('.thumbnails');
	bind_thumbnail_events_road('.thumbnails');
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
}
