#= require ./modernizr
#= require ./../../test-preserve3d
#= require util/flickity.pkgd.min
#= require util/scrollTo

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



class Lookbooky

  constructor: (lookbook, options) ->

    @lookbook = lookbook



    @force2d = options.use_2d

    console.log '@force2d', @force2d

    @stage = @lookbook.querySelector(".stage")
    @looks = @stage.querySelectorAll(".slide")
    @current_slide_index = options.initial_slide || 0
    @slideshow_position_array = []
    @rotation_offset = 0

    @thumbnails = document.querySelector('.thumbnails')


    # arrange the slides
    @setStage()
    # sync slideshow state
    @updateSlideshow()

    left_capture = document.querySelector('.left')
    right_capture = document.querySelector('.right')


    interaction_event = if Modernizr.touch then 'touchend' else 'click'

    # left_capture.addEventListener 'touchstart', @prevSlide
    # right_capture.addEventListener 'touchstart', @nextSlide
    # @thumbnails.addEventListener 'touchstart', @goToSlide

    left_capture.addEventListener interaction_event, @prevSlide
    right_capture.addEventListener interaction_event, @nextSlide
    @thumbnails.addEventListener interaction_event, @goToSlide

    # matchMedia("(min-width: 768px)").addListener @setScrollTop
    # @setScrollTop(matchMedia("(min-width: 768px)"))


    # if Modernizr.preserve3d and @looks.length > 3 and !@force2d
    #   addEventListener 'resize', @resizeStage3d

    # else
    #   addEventListener 'resize', @resizeStage2d

    window.addEventListener 'orientationchange', ->
      setTimeout @updateSlideshow(), 100


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


  getOffsetRect: (elem) =>
    # (1)
    box = elem.getBoundingClientRect()

    body = document.body
    docElem = document.documentElement

    # (2)
    scrollTop = window.pageYOffset || docElem.scrollTop || body.scrollTop
    scrollLeft = window.pageXOffset || docElem.scrollLeft || body.scrollLeft

    # (3)
    clientTop = docElem.clientTop || body.clientTop || 0
    clientLeft = docElem.clientLeft || body.clientLeft || 0

    # (4)
    top  = box.top +  scrollTop - clientTop
    left = box.left + scrollLeft - clientLeft

    { top: Math.round(top), left: Math.round(left) }


  # setScrollTop: (mediaQueryList) =>
  #   if mediaQueryList.matches
  #     if (Modernizr.touch)
  #       @scrollTop = 308
  #     else
  #       @scrollTop = 162

  #   else
  #     @scrollTop = 92


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
    node = event.target.parentNode

    console.log node

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

    # console.log(@looks)

    @looks.item(@current_slide_index).classList.add('current')


    if @thumbnails.querySelector('.current') != null then @thumbnails.querySelector('.current').classList.remove('current')
    @thumbnails.children[@current_slide_index].classList.add('current')

    # scrollTo(@scrollTop, 400)
    # console.log @getOffsetRect(@lookbook).top
    console.log(@current_slide_index)
    temp_scroll_top = @getOffsetRect(@lookbook).top - 70
    # if @current_slide_index != 0 then scrollTo(temp_scroll_top, 400)

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
    # translateX = @slideshow_position_array[@current_slide_index].translateX * -1

    offset = Math.round(document.body.clientWidth/2 - @looks.item(@current_slide_index).clientWidth / 2) - 22
    console.log(document.body.clientWidth/2)
    translateX = @looks.item(@current_slide_index).offsetLeft * -1 + offset
    transform = "translateX(" + translateX + "px)"

    # translateX = @looks.item(@current_slide_index).getBoundingClientRect().left * -1


    # transform = "translateX(" + translateX + "px)"

    @stage.style.webkitTransform = transform
    @stage.style.transform = transform

    if @stage.querySelector('.current') != null then @stage.querySelector('.current').classList.remove('current')

    @looks.item(@current_slide_index).classList.add('current')

    if @thumbnails.querySelector('.current') != null then @thumbnails.querySelector('.current').classList.remove('current')

    @thumbnails.children[@current_slide_index].classList.add('current')

    # scrollTo(@scrollTop, 400)
    # console.log @getOffsetRect(@lookbook).top
    # scrollTo(@getOffsetRect(@lookbook).top, 400)

    console.log(@current_slide_index)
    temp_scroll_top = @getOffsetRect(@lookbook).top - document.querySelector('.main-nav').clientHeight
    if @current_slide_index != 0 then scrollTo(temp_scroll_top, 400)


  setStage2d: () =>

    # for look, index in @looks
    #   translateX = index * 100
    #   transform = "translateX(" + translateX + "%)"
    #   look.style.webkitTransform = transform
    #   look.style.transform = transform

    #   @slideshow_position_array.push { translateX: translateX }

  resizeStage2d: () =>
    console.log 'this is a test'
    requestAnimationFrame @render

  resizeStage3d: () =>
    panelSize = @stage.offsetWidth
    translateZ = Math.round( ( panelSize / 2 ) /  Math.tan( Math.PI / @numberOfPanels ) )

    for look, index in @looks
      @slideshow_position_array[index].translateZ = translateZ

      rotateY = @slideshow_position_array[index].rotateY

      transform = "rotateY(" + rotateY + "deg) translateZ(" + translateZ + "px)"

      look.style.webkitTransform = transform
      look.style.transform = transform

  setStage: () ->
    if Modernizr.preserve3d and @looks.length > 3 and !@force2d
      @setStage3d.call()
      @lookbook.classList.add('three-dimensional')
    else
      @setStage2d.call()
      @lookbook.classList.add('two-dimensional')
    # @setStage2d.call()
  updateSlideshow: () ->
    if Modernizr.preserve3d and @looks.length > 3 and !@force2d then @updateSlideshow3d.call() else @updateSlideshow2d.call()
    # @updateSlideshow2d.call()

# document.addEventListener "DOMContentLoaded", ->
#   if(document.querySelector('#lookbook') != null)
#     use_2d = if window.location.pathname == "/art" then true else false

#     console.log 'use_2d', use_2d


#     lookbook = new Lookbook(document.querySelector('#lookbook'), { use_2d: use_2d})

  # if(document.querySelector('#artbook') != null)
  #   use_2d = if window.location.pathname == "/art" then true else false
  #   console.log 'use_2d', use_2d
  #   lookbook = new Lookbook(document.querySelector('#artbook'), { use_2d: use_2d, initial_slide: 2 })







