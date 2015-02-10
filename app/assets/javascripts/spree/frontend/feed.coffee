class Feed
  constructor: (selector) ->

    @feed = document.querySelector(selector)

    if @feed

      @cascadeFadeInProducts(@feed.querySelector('.feed-group'))

      @pagination_el = @feed.querySelector('.pagination')

      @feed.addEventListener 'click', @loadAjax

  fadeInThumbnail: (thumbnail)->
    thumbnail.classList.remove('loading')

  cascadeFadeInProducts: (feed_group) =>
    if feed_group
      @thumbnails = feed_group.querySelectorAll('a')

      for index, product of @thumbnails

        setTimeout ( =>
          @thumbnails.item(index).classList.remove('loading')
        ), index * 500,

        setTimeout @fadeInThumbnail, index*100, @thumbnails.item(index)

      return true
    else
      return false

  justDoIt: (event) =>
    feed_group = @xhr.responseXML.querySelector('.feed .feed-group')
    new_next = @xhr.responseXML.querySelector('.feed .pagination')

    @feed.appendChild(feed_group)
    @feed.appendChild(new_next)

    @cascadeFadeInProducts(feed_group)



  loadAjax: (event) =>

    if event.target.parentNode.classList.contains('next')
      event.preventDefault()

      url = event.target.href + '&ajax=true'

      @xhr = new XMLHttpRequest()

      @xhr.onload = @justDoIt

      @xhr.open "GET", url
      @xhr.responseType = "document"
      @xhr.send()


      # Report errors if they happen
      @xhr.addEventListener "error", (e) ->
        console "Error: " + e + " Could not load url."




document.addEventListener "DOMContentLoaded", ->
  if(document.querySelector('.feed') != null && document.querySelector('.feed').querySelectorAll('a').length > 0)
    feed = new Feed('.feed')
