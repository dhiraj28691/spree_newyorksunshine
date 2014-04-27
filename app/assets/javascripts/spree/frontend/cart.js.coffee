justDoIt = ->

  link_to_cart = document.querySelector('#link-to-cart')

  fragment = this.responseXML.body.innerHTML

  document.querySelector('#link-to-cart').innerHTML = fragment


Spree.fetch_cart = ->
  true

  url = Spree.routes.cart_link

  xhr = new XMLHttpRequest()

  xhr.onload = justDoIt

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