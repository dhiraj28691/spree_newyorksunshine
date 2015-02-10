#= require ./../../util/scrollTo

class HeroVideo
  constructor: (selector) ->
    video_container_el = document.querySelector(selector)
    @video_el = video_container_el.querySelector('video')
    text_container = video_container_el.querySelector('.description')

    @top_area_el = video_container_el.querySelector('.top-area')
    @bottom_area_el = video_container_el.querySelector('.bottom-area')

    @top_area_el.addEventListener 'click', @toggleState

    @bottom_area_el.addEventListener 'click', @scrollToSlideshow


    @is_playing = true

    @scrollTop = window.innerHeight

  toggleState: (event) =>
    event.preventDefault()


    if @is_playing == true

      @video_el.pause()
      # setTimeout =>
      #   @video_el.pause()
      # , 400



      @video_el.setAttribute('data-state', 'paused')
      document.body.classList.add('dark')

      @is_playing = false



    else

      @video_el.play()
      # setTimeout =>
      #   @video_el.play()
      # , 200


      @video_el.setAttribute('data-state', 'playing')
      document.body.classList.remove('dark');

      @is_playing = true


  scrollToSlideshow: (event) =>
    event.preventDefault()
    scrollTo(@scrollTop, 800)



document.addEventListener "DOMContentLoaded", ->
  if(document.querySelector('#video-container') != null)
    hero_video = new HeroVideo('#video-container')
