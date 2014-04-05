//= require ./modernizr

class Lookbook

  "use strict"

  nextSlide: () ->


  prevSlide: () ->



  initSlideshow: () ->

    @lookbook = document.querySelector('#lookbook')
    console.log "@lookbook", @lookbook

    @looks = @lookbook.children
    console.log "@looks", @looks

    return




  setStage: () ->

    panelSize = @looks[0].width
    numberOfPanels = @looks.length
    slideshow_position_array = []



    tz = Math.round( ( panelSize / 2 ) /  Math.tan( Math.PI / numberOfPanels ) ) * -1


    for look, index in @looks
      console.log index, look

      ry = 360/looks.length * index * -1

      look.style.webkitTransform = "rotateY(" + ry + "deg) translateZ(" + tz + "px)"

      slideshow_position_array.push { rotateY: ry, translateZ: tz }

    console.log slideshow_position_array


    lookbook.style.webkitTransform = "translateZ(" + (tz * -1) + "px)"


  respondToKeydown: (event)->

    switch event.which
      when 37
        console.log "prev slide"
      when 39
        console.log "next slide"


lookbook = new Lookbook



document.addEventListener "DOMContentLoaded", lookbook.initSlideshow

window.addEventListener "load", lookbook.setStage



window.addEventListener 'keydown', lookbook.respondToKeydown
