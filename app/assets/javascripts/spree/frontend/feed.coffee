class Feed
  constructor: (selector) ->

    @feed = document.querySelector(selector)

    if @feed

      pagination_el = @feed.querySelector('.pagination')

      pagination_el.addEventListener 'click', @loadAjax


  justDoIt: (event)->

    document.querySelector('#feed').insertBefore(this.responseXML.querySelector('.feed-group'), document.querySelector('.pagination'))

  loadAjax: (event) =>
    event.preventDefault()

    url = event.target.href + '&ajax'

    xhr = new XMLHttpRequest()

    xhr.onload = @justDoIt


    xhr.open "GET", url
    xhr.responseType = "document"
    xhr.send()


    # xhr.onreadystatechange = @justDoIt


    # Report errors if they happen
    xhr.addEventListener "error", (e) ->
      console "Error: " + e + " Could not load url."




document.addEventListener "DOMContentLoaded", ->

  feed = new Feed('#feed')
