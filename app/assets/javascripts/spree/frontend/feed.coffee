# class Feed
#  constructor:



document.addEventListener "DOMContentLoaded", ->

  pagination_el = document.querySelector('.pagination')

  if pagination_el
    document.querySelector('.pagination').addEventListener 'click', (event)->
      event.preventDefault()

      url = event.target.href + '&ajax'

      xhr = new XMLHttpRequest()
      xhr.open "GET", url
      xhr.onreadystatechange = ()->
        if xhr.readyState != 4 || xhr.status != 200 then return

        console.log xhr

        # HTML string
        div = document.createElement('div')

        div.innerHTML = xhr.responseText

        fragment = div.firstChild

        console.log fragment

        content_el = document.querySelector('#content')
        # console.log content_el
        content_el.appendChild(fragment)

      xhr.send()