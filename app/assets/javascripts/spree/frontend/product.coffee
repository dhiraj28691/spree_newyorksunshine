class ProductImages
  constructor: (selector) ->
    @product_images = document.querySelector(selector)
    @main_image_wrapper = @product_images.querySelector('#main-image')
    @product_thumbnails = @product_images.querySelector('#product-thumbnails')


    # console.log '@product_thumbnails', @product_thumbnails
    # @thumbnails = @product_thumbnails.querySelectorAll("a")

    @main_image_wrapper.addEventListener 'click', (event)->
      event.preventDefault()
      console.log this.parentNode.classList.toggle('zoom')

    if @product_thumbnails
      @product_thumbnails.addEventListener 'click', (e)=>
        if matchMedia("(min-width: 768px)").matches
          e.preventDefault()

        if e.target.classList.contains('thumbnail')
          # console.log e.target
          console.log @main_image
          @main_image_wrapper.querySelector('img').src = e.target.parentNode.href;


document.addEventListener "DOMContentLoaded", ->
  if(document.querySelector('#product-images') != null)
    product_thumbnails = new ProductImages('#product-images')
