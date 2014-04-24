class PostSlideshow
  constructor: (selector) ->
    @slideshow = if selector instanceof Node then selector else document.querySelector(selector)
    @stage = @slideshow.querySelector('.stage')
    @slides = @stage.querySelectorAll('.slide')
    @slideshow_length = @slides.length
    @slideshow_position_array = []
    @current_slide_index = 1
    @setStage()
    @renderSlideshow()

    @slideshow.addEventListener 'click', @goToNext


  setStage: =>
    for slide, index in @slides
      translateX = index * 100
      transform = "translateX(" + translateX + "%)"
      slide.style.webkitTransform = transform
      slide.style.transform = transform

      @slideshow_position_array.push { translateX: translateX }


  renderSlideshow: =>
    translateX = @slideshow_position_array[@current_slide_index].translateX * -1
    transform = "translateX(" + translateX + "%)"
    console.log 'transform', transform
    @stage.style.webkitTransform = transform
    @stage.style.transform = transform

  goToNext: =>
    @current_slide_index = if @current_slide_index < @slideshow_length - 1 then @current_slide_index + 1 else 0
    @renderSlideshow()


class PostEmbed
  constructor: (selector) ->
    @iframe = if selector instanceof Node then selector else document.querySelector(selector)

    @aspect_ratio = @iframe.height/@iframe.width

    @iframe.width = "100%"

    @renderIframe()


  renderIframe: =>


    # alert('WASSUP')

    if @iframe_clientWidth != @iframe.clientWidth
      console.log(window.innerWidth)
      @iframe_clientWidth = @iframe.clientWidth

      @iframe.height = @iframe.clientWidth * @aspect_ratio

      console.log(@iframe.clientWidth,@aspect_ratio)


    requestAnimationFrame(@renderIframe)
    return


document.addEventListener "DOMContentLoaded", ->

  for slideshow in document.querySelectorAll('article.post .slideshow')
    new PostSlideshow(slideshow)

  for iframe in document.querySelectorAll('iframe')
    new PostEmbed(iframe)
