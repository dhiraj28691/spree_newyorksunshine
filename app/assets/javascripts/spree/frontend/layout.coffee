#= require modernizr
#= require polyfills/classList
#= require polyfills/matchMedia
#= require polyfills/requestAnimationFrame

class Layout

  constructor: ->
    # ratio = -0.5
    @ratio = -1
    @threshhold = -71

    @new_page_flag = true

    @header = document.querySelector('header')
    @wrapper = document.querySelector('#wrapper')
    @equivalent_label = document.querySelector('#equivalent')
    @equivalent_check = document.querySelector('#equivalent-check')

    # Subscribe form
    @subscribe_wrapper = document.querySelector('#subscribe-wrapper')
    @subscribe_form = @subscribe_wrapper.querySelector('#subscribe-form')
    @close_button = @subscribe_form.querySelector('a.close')

    @flash_errors = @subscribe_form.querySelector('#flash-errors')

    addEventListener 'load', @fadeInContent
    setTimeout @fadeInContent, 2000

    matchMedia("(min-width: 768px)").addListener @mediaListener
    @mediaListener(matchMedia("(min-width: 768px)"))

    # matchMedia("(min-width: 2560px)").addListener @setThreshold
    # @setThreshold(matchMedia("(min-width: 2560px)"))

    # For safari when swiping back
    window.addEventListener 'pageshow', (event)=>
      if (event.persisted) then @fadeInContent()


    document.documentElement.addEventListener 'click', (event)->
      # @new_page_flag is true if mavigating to new page so content fades out
      # if anchor is a mailto: link, then page is not flagged to fade out
      @new_page_flag = if /mailto:/i.test(event.target.href) then false else true

    window.addEventListener 'beforeunload', =>

      if @new_page_flag then @fadeOutContent()

    @equivalent_label.addEventListener 'touchend', toggleMenu

    # Form event bindings
    document.querySelector('a#subscribe').addEventListener 'click', @showForm

    @close_button.addEventListener 'click', @hideForm

    @subscribe_form.addEventListener 'submit', @submitForm

    @subscribe_wrapper.addEventListener 'click', @hideForm

  fadeInContent: =>

    document.documentElement.classList.remove('loading')

  fadeOutContent: ->

    document.documentElement.classList.add('loading')

  mediaListener: (mediaQueryList) =>
    if mediaQueryList.matches && !Modernizr.touch
      @parallax()

    else
      cancelAnimationFrame(@requestion)
      @header.removeAttribute("style")
      @header.classList.remove('pinned')

  parallax: =>
    if @pageYOffset != window.pageYOffset && @wrapper.clientHeight >= window.innerHeight
      @pageYOffset = window.pageYOffset

      if(@pageYOffset > 0)

        transform = Math.max(@pageYOffset/2, 0)
        transform = transform * @ratio
        transform = Math.max(transform, @threshhold)

        @header.style[Modernizr.prefixed('transform')] = "translateY(" + transform + "px)";

      else

        transform = @pageYOffset * -1

        @header.style[Modernizr.prefixed('transform')] = "translateY(" + transform + "px)";

        @header.style[Modernizr.prefixed('transform')] = "translateY(" + transform + "px)";


      if pageYOffset * @ratio <= @threshhold then @header.classList.add('pinned') else @header.classList.remove('pinned')

    @requestion = requestAnimationFrame @parallax

  toggleMenu = (event) =>
    event.stopPropagation()

  showForm: (event) =>
    event.preventDefault()
    @subscribe_wrapper.classList.add('active')

  hideForm: (event) =>
    # If you either the close button or outside the subscribe form it will close
    if (event.target == @close_button || event.target == @subscribe_wrapper)
      event.preventDefault()
      @subscribe_wrapper.classList.remove('active')

  justDoIt: (event) =>

    errors = event.currentTarget.response.errors
    error_messages = []

    if errors.length > 0

      for error in errors
        # console.log error
        error_messages.push '<li>' + error + '</li>'

    else
      @subscribe_form.email.value = ""
      error_messages.push '<li>Thank you.</li>'


    @flash_errors.innerHTML = error_messages.join("")

    @subscribe_wrapper.classList.add('active')

  submitForm: (event) =>
    event.preventDefault()

    @subscribe_wrapper.classList.remove('active')

    # Prepare data
    formData = new FormData(@subscribe_form)


    xhr = new XMLHttpRequest()

    xhr.onload = @justDoIt

    method = @subscribe_form.method
    url = @subscribe_form.action


    xhr.open method, url
    xhr.responseType = "json"
    xhr.send(formData)

    # Report errors if they happen
    xhr.addEventListener "error", (e) ->
      console "Error: " + e + " Could not load url."

document.addEventListener "DOMContentLoaded", ->

  new Layout()

