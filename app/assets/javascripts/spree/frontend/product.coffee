class ProductThumbnails
  constructor: (@container) ->
    @product_thumbnails = @container.querySelector('#product-thumbnails')
    @thumbnails = @product_thumbnails.querySelectorAll("li a")
    main_image = @container.querySelector('.main-image')
    for thumb, i in @thumbnails
      thumb.addEventListener 'click', (e)->
        e.preventDefault()
        main_image.src = this.href;

document.addEventListener "DOMContentLoaded", ->
  if(document.querySelector('#product-thumbnails') != null)
    product_thumbnails = new ProductThumbnails(document.querySelector('.pdp-image-container'))

