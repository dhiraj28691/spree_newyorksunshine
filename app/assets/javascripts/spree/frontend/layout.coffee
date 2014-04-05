//= require ./modernizr

header = undefined
transform = undefined
# ratio = -0.5
ratio = -1
threshhold = -76

fadeInContent = ->
  console.log 'fading in content'
  document.documentElement.classList.remove('loading')

window.addEventListener 'load', fadeInContent

setTimeout fadeInContent, 2000


document.addEventListener "DOMContentLoaded", ->
  header = document.querySelector('header')

window.addEventListener 'scroll', ->
  requestAnimationFrame ->

    transform = Math.max(window.scrollY, 0)
    transform = transform * ratio
    transform = Math.max(transform, threshhold)

    header.style.webkitTransform = "translateY(" + transform + "px)";
    header.style.transform = "translateY(" + transform + "px)";



window.addEventListener 'beforeunload', ->
  document.documentElement.classList.add('loading')
