#= require ./modernizr
#= require ./../../test-preserve3d
#= require ./../../util/scrollTo

"use strict"


# t = current time
# b = start value
# c = change in value
# d = duration
Math.easeInOutQuad = (t, b, c, d)->
  t /= d/2
  if t < 1 then return c/2*t*t + b
  t--
  -c/2 * (t*(t-2) - 1) + b



class Lookbook

  constructor: (@lookbook) ->

    @stage = @lookbook.querySelector(".stage")
    @looks = @stage.children
    @current_slide_index = 0
    @slideshow_position_array = []
    @rotation_offset = 0

    @thumbnails = document.querySelector('.thumbnails')


    # arrange the slides
    @setStage()
    # sync slideshow state
    @updateSlideshow()

    @slideshow_scroll_top = if matchMedia("(min-width: 768px)").matches then 230 else 97

    left_capture = document.querySelector('.left')
    right_capture = document.querySelector('.right')


    left_capture.addEventListener 'touchstart', @prevSlide
    right_capture.addEventListener 'touchstart', @nextSlide
    # @thumbnails.addEventListener 'touchstart', @goToSlide

    left_capture.addEventListener 'click', @prevSlide
    right_capture.addEventListener 'click', @nextSlide
    @thumbnails.addEventListener 'click', @goToSlide

    matchMedia("(min-width: 768px)").addListener @setScrollTop
    @setScrollTop(matchMedia("(min-width: 768px)"))


    addEventListener 'resize', @resizeStage


    addEventListener 'keydown', (event) =>
      switch event.which
        when 32
          @nextSlide()
          event.preventDefault()
        when 37
          @prevSlide()
          event.preventDefault()
        when 39
          @nextSlide()
          event.preventDefault()

  setScrollTop: (mediaQueryList) =>
    @scrollTop = if mediaQueryList.matches == true then 219 else 92


  prevSlide: (event) =>
    if event
      event.stopPropagation()
      event.preventDefault()

    if @current_slide_index == 0 then @rotation_offset--

    @current_slide_index = if @current_slide_index > 0 then @current_slide_index - 1 else @looks.length - 1

    @updateSlideshow()

  nextSlide: (event) =>
    if event
      event.stopPropagation()
      event.preventDefault()

    if @current_slide_index == @looks.length - 1 then @rotation_offset++

    @current_slide_index = if @current_slide_index < @looks.length - 1 then @current_slide_index + 1 else 0

    @updateSlideshow()

  goToSlide: (event) =>
    node = event.target

    @current_slide_index = [].indexOf.call(node.parentNode.children, node)

    @updateSlideshow()

  updateSlideshow3d: () =>
    translateZ = @slideshow_position_array[@current_slide_index].translateZ * -1
    translateX = @slideshow_position_array[@current_slide_index].translateX * -1
    rotateY = (@slideshow_position_array[@current_slide_index].rotateY + (@rotation_offset * 360)) * -1

    # the_top = @slideshow_top

    transform = "translateZ(" + translateZ + "px) translateX(" + translateX + "%) rotateY(" + rotateY + "deg)"

    @stage.style.webkitTransform = transform
    @stage.style.transform = transform


    if @stage.querySelector('.current') != null then @stage.querySelector('.current').classList.remove('current')
    @stage.children[@current_slide_index].classList.add('current')


    if @thumbnails.querySelector('.current') != null then @thumbnails.querySelector('.current').classList.remove('current')
    @thumbnails.children[@current_slide_index].classList.add('current')

    scrollTo(@scrollTop, 400)

  setStage3d: () =>
    panelSize = @stage.offsetWidth
    @numberOfPanels = @looks.length

    translateZ = Math.round( ( panelSize / 2 ) /  Math.tan( Math.PI / @numberOfPanels ) )
    translateX = 0

    @slideshow_position_array = []


    if Modernizr.preserve3d

      for look, index in @looks
        rotateY = 360/@looks.length * index
        transform = "rotateY(" + rotateY + "deg) translateZ(" + translateZ + "px)"

        look.style.webkitTransform = transform
        look.style.transform = transform


        @slideshow_position_array.push { rotateY: rotateY, translateX: translateX, translateZ: translateZ }

  updateSlideshow2d: () =>
    translateX = @slideshow_position_array[@current_slide_index].translateX * -1

    transform = "translateX(" + translateX + "%)"

    @stage.style.webkitTransform = transform
    @stage.style.transform = transform

    if @stage.querySelector('.current') != null then @stage.querySelector('.current').classList.remove('current')

    @stage.children[@current_slide_index].classList.add('current')

    if @thumbnails.querySelector('.current') != null then @thumbnails.querySelector('.current').classList.remove('current')

    @thumbnails.children[@current_slide_index].classList.add('current')

    scrollTo(document.body, 248, 400)

  setStage2d: () =>

    for look, index in @looks
      translateX = index * 100
      transform = "translateX(" + translateX + "%)"
      look.style.webkitTransform = transform
      look.style.transform = transform

      @slideshow_position_array.push { translateX: translateX }

  resizeStage: () =>
    panelSize = @stage.offsetWidth
    translateZ = Math.round( ( panelSize / 2 ) /  Math.tan( Math.PI / @numberOfPanels ) )

    for look, index in @looks
      @slideshow_position_array[index].translateZ = translateZ

      rotateY = @slideshow_position_array[index].rotateY

      transform = "rotateY(" + rotateY + "deg) translateZ(" + translateZ + "px)"

      look.style.webkitTransform = transform
      look.style.transform = transform

  setStage: () ->
    if Modernizr.preserve3d then @setStage3d.call() else @setStage2d.call()

  updateSlideshow: () ->
    if Modernizr.preserve3d then @updateSlideshow3d.call() else @updateSlideshow2d.call()

document.addEventListener "DOMContentLoaded", ->
  if(document.querySelector('#lookbook') != null)
    lookbook = new Lookbook(document.querySelector('#lookbook'))

