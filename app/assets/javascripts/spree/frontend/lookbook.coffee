//= require ./modernizr

"use strict"


# scrollTo = (element, to, duration)->
#   start = element.scrollTop
#   change = to - start
#   currentTime = 0
#   increment = 20

#   animateScroll = ->
#     currentTime += increment
#     val = Math.easeInOutQuad(currentTime, start, change, duration)
#     element.scrollTop = val;
#     if currentTime < duration then requestAnimationFrame(animateScroll)

#   animateScroll()




scrollTo = (element, to, duration)->
  start = element.scrollTop
  change = to - start
  initialTime = Date.now()
  finalTime = initialTime + duration

  # exit out if already scrolled to top
  if change >= 0 then return

  animateScroll = ->
    currentTime = Date.now()
    val = Math.easeInOutQuad(currentTime - initialTime, start, change, duration)
    element.scrollTop = val;
    if currentTime < finalTime then requestAnimationFrame(animateScroll)

  animateScroll()





# t = current time
# b = start value
# c = change in value
# d = duration
Math.easeInOutQuad = (t, b, c, d)->
  t /= d/2
  if t < 1 then return c/2*t*t + b
  t--
  -c/2 * (t*(t-2) - 1) + b




# window.scrollTo = (element, to, duration)->
#   if duration < 0 then return

#   difference = to - element.scrollTop

#   perTick = difference / duration * 10

#   setTimeout ->
#     element.scrollTop = element.scrollTop + perTick

#     if (element.scrollTop == to) then return

#     scrollTo element, to, duration - 10

#   , 10





class Lookbook

  constructor: (@lookbook) ->

    @stage = @lookbook.querySelector(".stage")
    @looks = @stage.children
    @current_slide_index = 0
    @slideshow_position_array = []
    @rotation_offset = 0

    @thumbnails = document.querySelector('.thumbnails')

    @thumbnails.addEventListener 'click', @goToSlide


    # arrange the slides
    @setStage()
    # sync slideshow state
    @updateSlideshow()


  prevSlide: () ->
    if @current_slide_index == 0 then @rotation_offset--

    # @current_slide_index--
    @current_slide_index = if @current_slide_index > 0 then @current_slide_index - 1 else @looks.length - 1

    console.log this
    @updateSlideshow()

  nextSlide: () ->
    if @current_slide_index == @looks.length - 1 then @rotation_offset++

    # @current_slide_index++

    @current_slide_index = if @current_slide_index < @looks.length - 1 then @current_slide_index + 1 else 0

    @updateSlideshow()

  goToSlide: (event) =>
    node = event.target

    @current_slide_index = [].indexOf.call(node.parentNode.children, node)

    @updateSlideshow()

    # scrollTo(document.body, 0, 800)
    scrollTo(document.body, 0, 400)



  updateSlideshow: () ->
    translateZ = @slideshow_position_array[@current_slide_index].translateZ * -1
    translateX = @slideshow_position_array[@current_slide_index].translateX * -1
    rotateY = (@slideshow_position_array[@current_slide_index].rotateY + (@rotation_offset * 360)) * -1

    transform = "translateZ(" + translateZ + "px) translateX(" + translateX + "%) rotateY(" + rotateY + "deg)"

    @stage.style.webkitTransform = transform
    @stage.style.transform = transform

    if @stage.querySelector('.current') != null then @stage.querySelector('.current').classList.remove('current')

    @stage.children[@current_slide_index].classList.add('current')

    if @thumbnails.querySelector('.current') != null then @thumbnails.querySelector('.current').classList.remove('current')

    @thumbnails.children[@current_slide_index].classList.add('current')



  setStage: () ->
    panelSize = @stage.offsetWidth
    numberOfPanels = @looks.length

    translateZ = Math.round( ( panelSize / 2 ) /  Math.tan( Math.PI / numberOfPanels ) )
    translateX = 0

    for look, index in @looks
      rotateY = 360/@looks.length * index
      transform = "rotateY(" + rotateY + "deg) translateZ(" + translateZ + "px)"
      look.style.webkitTransform = transform
      look.style.transform = transform

      @slideshow_position_array.push { rotateY: rotateY, translateX: translateX, translateZ: translateZ }


    # for look, index in @looks
    #   rotateY = 0
    #   translateZ = 0
    #   translateX = index * 100

    #   transform = "rotateY(" + rotateY + "deg) translateX(" + translateX + "%) translateZ(" + translateZ + "px)"

    #   look.style.webkitTransform = transform

    #   @slideshow_position_array.push { rotateY: rotateY, translateX: translateX, translateZ: translateZ }



document.addEventListener "DOMContentLoaded", ->

  if(document.querySelector('#lookbook') != null)

    lookbook = new Lookbook(document.querySelector('#lookbook'))


    document.querySelector('.left').addEventListener 'click', ()->
      lookbook.prevSlide()

    document.querySelector('.right').addEventListener 'click', ()->
      lookbook.nextSlide()


    addEventListener 'keydown', (event) ->
      switch event.which
        when 37
          lookbook.prevSlide()
        when 39
          lookbook.nextSlide()

