class ProductImages
  constructor: (selector) ->
    @product_images = document.querySelector(selector)
    @main_image_wrapper = @product_images.querySelector('#main-image')
    @product_thumbnails = @product_images.querySelector('#product-thumbnails')
    @zoom = @main_image_wrapper.querySelector('#zoom')

    @slideshow_length = @main_image_wrapper.querySelectorAll('img').length


    @zoom.addEventListener 'click', (event)=>
      event.preventDefault()
      event.stopPropagation()
      @product_images.classList.toggle('zoom')

    if @product_thumbnails
      @product_thumbnails.addEventListener 'click', @goToSlide

    @main_image_wrapper.addEventListener 'click', @goToNext




  goToSlide: (event) =>
    if matchMedia("(min-width: 768px)").matches
      event.preventDefault()

    if event.target.classList.contains('thumbnail')
      # console.log event.target.parentNode.parentNode.children
      # @main_image_wrapper.querySelector('img').src = event.target.parentNode.href;

      @current_slide_index = [].indexOf.call(event.target.parentNode.parentNode.children, event.target.parentNode)

      # if @main_image_wrapper.querySelector('.current')
      #   @main_image_wrapper.querySelector('.current').classList.remove('current')

      # @main_image_wrapper.children.item(@current_slide_index).classList.add('current')
      @render()

      console.log @main_image_wrapper.children.item(@current_slide_index)

  goToNext: (event) =>
    event.preventDefault()

    console.log @slideshow_length
    console.log @product_images.children.length

    @current_slide_index = if @current_slide_index < @slideshow_length - 1 then @current_slide_index + 1 else 0

    @render()


  render: () =>
    if @main_image_wrapper.querySelector('.current')
      @main_image_wrapper.querySelector('.current').classList.remove('current')

    @main_image_wrapper.children.item(@current_slide_index).classList.add('current')


document.addEventListener "DOMContentLoaded", ->
  if(document.querySelector('#product-images') != null)
    product_thumbnails = new ProductImages('#product-images')
