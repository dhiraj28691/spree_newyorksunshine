#= require spree

updateCartMenu = (event)->

  link_to_cart = document.querySelector('#link-to-cart')

  fragment = if (this.status == 200) then this.responseXML.body.innerHTML else "error"

  $fragment = $(fragment)


  if window.location.pathname == "/cart"

    $('#link-to-cart').html($fragment).find("a").addClass("current")

  else
    $('#link-to-cart').html($fragment)


  # document.querySelector('#link-to-cart').innerHTML = fragment


Spree.fetch_cart = ->
  true;

  window.location.origin = window.location.origin || window.location.protocol + "//" + window.location.hostname + (if window.location.port then ":" + window.location.port)

  url = Spree.pathFor("cart_link")

  xhr = new XMLHttpRequest()

  xhr.addEventListener 'load', updateCartMenu

  xhr.open "GET", url
  xhr.responseType = "document"
  xhr.send()


  # Report errors if they happen
  xhr.addEventListener "error", (e) ->
    console "Error: " + e + " Could not load url."


document.addEventListener "DOMContentLoaded", ->

  line_items = document.querySelector('#line_items')

  if line_items
    document.querySelector('#line_items').addEventListener 'click', (event)->

      if event.target.classList.contains("delete")
        event.preventDefault()
        event.stopPropagation()

        event.target.parentNode.parentNode.querySelector('input.line_item_quantity').value = 0

        document.forms['update-cart'].submit()

      else

      # ($ 'form#update-cart a.delete').show().one 'click', ->

    , false

    document.forms['update-cart'].addEventListener 'submit', (event)->
      document.querySelector('#update-button').disabled = true



  Spree.fetch_cart()