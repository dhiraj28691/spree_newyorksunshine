document.addEventListener "DOMContentLoaded", ->

  pagination_el = document.querySelector('.pagination')

  console.log pagination_el


  pagination_el.addEventListener 'click', (event)->
    event.preventDefault()

    url = event.target.href + '&ajax'

    xhr = new XMLHttpRequest()
    xhr.open "GET", url
    xhr.onreadystatechange = ()->
      if xhr.readyState != 4 || xhr.status != 200 then return

      # HTML string
      div = document.createElement('div')

      div.innerHTML = xhr.responseText

      fragment = div.firstChild


      document.querySelector('#content').appendChild(fragment)



    xhr.send()