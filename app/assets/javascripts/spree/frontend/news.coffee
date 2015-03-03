#= require util/scrollTo
#= require util/getPosition

class PostSlideshow
  constructor: (selector) ->
    @selector = selector
    @slideshow = if selector instanceof Node then selector else document.querySelector(selector)
    @stage = @slideshow.querySelector('.stage')
    @slides = @stage.querySelectorAll('.slide')
    @slideshow_length = @slides.length
    @slideshow_position_array = []
    @current_slide_index = 0

    console.log @selector

    # @setStage()
    # @render()

    @slideshow.addEventListener 'click', @goToNext

    addEventListener 'load', =>
      @offset_y = getPosition(@selector).y - 61

      matchMedia("(min-width: 768px)").addListener @mediaListener
      @mediaListener(matchMedia("(min-width: 768px)"))

      console.log 'this is a test'
      setTimeout =>
        @stage.classList.add('active')
      , 800


  setStage: =>
    for slide, index in @slides
      translateX = index * 100
      transform = "translateX(" + translateX + "%)"
      slide.style.webkitTransform = transform
      slide.style.transform = transform

      @slideshow_position_array.push { translateX: translateX }

  clearStage: =>
    for slide, index in @slides
      # slide.removeAttribute('style')
      slide.style.webkitTransform = 'none'
      slide.style.transform = 'none'


  mediaListener: (mql)=>
    # console.log mql, mql.matches
    if mql.matches
      # @setStage()
      @render()

      # @offset_y = getPosition(@selector).y - 61


    else
      @clearStage()
      @veto()

      # @offset_y = undefined


  render: =>
    # translateX = @slideshow_position_array[@current_slide_index].translateX * -1

    translateX = getPosition(@slides.item(@current_slide_index)).x * -1 + Math.floor(window.innerWidth/2) - @slides.item(@current_slide_index).clientWidth/2

    transform = "translateX(" + translateX + "px)"

    console.log(getPosition(@slides.item(@current_slide_index)))

    @stage.style.webkitTransform = transform
    @stage.style.transform = transform

    # @offset_y = getPosition(@selector).y - 61
    # scrollTo(@offset_y, 400)


  veto: =>
    @current_slide_index = 0
    @stage.style.webkitTransform = "none"
    @stage.style.transform = "none"


  goToNext: =>
    if matchMedia("(min-width: 768px)").matches
      @current_slide_index = if @current_slide_index < @slideshow_length - 1 then @current_slide_index + 1 else 0
      @render()


class PostEmbed
  constructor: (selector) ->
    @iframe = if selector instanceof Node then selector else document.querySelector(selector)

    @aspect_ratio = 0.5625

    @iframe.width = "100%"

    @renderIframe()


  renderIframe: =>

    requestAnimationFrame(@renderIframe)

    if @iframe_clientWidth != @iframe.clientWidth
      @iframe_clientWidth = @iframe.clientWidth
      @iframe.height = @iframe.clientWidth * @aspect_ratio

    return


document.addEventListener "DOMContentLoaded", ->

  for slideshow in document.querySelectorAll('article.post .slideshow')
    new PostSlideshow(slideshow)

  for iframe in document.querySelectorAll('iframe')
    new PostEmbed(iframe)
