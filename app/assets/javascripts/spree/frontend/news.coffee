#= require util/scrollTo
#= require util/getPosition

class PostSlideshow
  constructor: (selector) ->
    @slideshow = if selector instanceof Node then selector else document.querySelector(selector)
    @stage = @slideshow.querySelector('.stage')
    @slides = @stage.querySelectorAll('.slide')
    @slideshow_length = @slides.length
    @slideshow_position_array = []
    @current_slide_index = 0


    @setStage()
    @renderSlideshow()

    @slideshow.addEventListener 'click', @goToNext

    addEventListener 'load', =>
      @offset_y = getPosition(selector).y - 45




    matchMedia("(min-width: 768px)").addListener @mediaListener
    @mediaListener(matchMedia("(min-width: 768px)"))



  setStage: =>
    for slide, index in @slides
      translateX = index * 100
      transform = "translateX(" + translateX + "%)"
      slide.style.webkitTransform = transform
      slide.style.transform = transform

      @slideshow_position_array.push { translateX: translateX }

  clearStage: =>
    for slide, index in @slides
      slide.removeAttribute('style')


  mediaListener: (mql)=>
    # console.log mql, mql.matches


  renderSlideshow: =>
    translateX = @slideshow_position_array[@current_slide_index].translateX * -1
    transform = "translateX(" + translateX + "%)"
    @stage.style.webkitTransform = transform
    @stage.style.transform = transform

    scrollTo(@offset_y, 400)

  goToNext: =>
    @current_slide_index = if @current_slide_index < @slideshow_length - 1 then @current_slide_index + 1 else 0
    @renderSlideshow()


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
