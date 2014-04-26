//= require modernizr
//= require polyfills/classList
//= require polyfills/matchMedia
//= require polyfills/requestAnimationFrame

class Layout

  constructor: ->
    # ratio = -0.5
    @ratio = -1
    @threshhold = -76

    @new_page_flag = true

    @pageYOffset = window.pageYOffset

    @header = document.querySelector('header')
    @equivalent_label = document.querySelector('#equivalent')
    @equivalent_check = document.querySelector('#equivalent-check')



    addEventListener 'load', @fadeInContent
    setTimeout @fadeInContent, 2000

    matchMedia("(min-width: 768px)").addListener @mediaListener
    @mediaListener(matchMedia("(min-width: 768px)"))


    document.documentElement.addEventListener 'click', (event)->
      # @new_page_flag is true if mavigating to new page so content fades out
      # if anchor is a mailto: link, then page is not flagged to fade out
      @new_page_flag = if /mailto:/i.test(event.target.href) then false else true

    window.addEventListener 'beforeunload', =>

      if @new_page_flag then @fadeOutContent()

    @equivalent_label.addEventListener 'touchstart', toggleMenu


  fadeInContent: =>

    document.documentElement.classList.remove('loading')

  fadeOutContent: ->

    document.documentElement.classList.add('loading')

  mediaListener: (mediaQueryList) =>
    if mediaQueryList.matches
      @parrallax()

    else
      cancelAnimationFrame(@requestion)
      @header.removeAttribute("style")
      @header.classList.remove('pinned')


  parrallax: =>

    if @pageYOffset != window.pageYOffset

      @pageYOffset = window.pageYOffset

      transform = Math.max(pageYOffset/2, 0)
      transform = transform * @ratio
      transform = Math.max(transform, @threshhold)

      @header.style.webkitTransform = "translateY(" + transform + "px)";
      @header.style.transform = "translateY(" + transform + "px)";


      if pageYOffset * @ratio <= @threshhold then @header.classList.add('pinned') else @header.classList.remove('pinned')

    @requestion = requestAnimationFrame @parrallax

  toggleMenu = (event) =>
    event.stopPropagation()
    event.preventDefault()
    @equivalent_check.checked = if @equivalent_check.checked then false else true




document.addEventListener "DOMContentLoaded", ->
  layout = new Layout()