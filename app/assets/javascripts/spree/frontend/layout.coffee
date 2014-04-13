//= require ./modernizr

header = undefined
transform = undefined
# ratio = -0.5
ratio = -1
threshhold = -76

new_page_flag = true

# viaArrayAccessReverse2 = (ls)->
#   retval = []
#   for( var i = ls.length - 1; i >= 0; i-- )
#      retval[i] = ls[i]
#   retval

# viaInitializedArrayAccessReverse2 = (ls)->
#   retval = new Array(ls.length)

#   for(var i = ls.length - 1; i >= 0; i-- )
#     retval[i] = ls[i]

#   retval


fadeInContent = ->
  console.log 'fading in content'
  document.documentElement.classList.remove('loading')

window.addEventListener 'load', fadeInContent

setTimeout fadeInContent, 2000


document.addEventListener "DOMContentLoaded", ->
  header = document.querySelector('header')


fadeOutContent = ->
  document.documentElement.classList.add('loading')


if matchMedia("(min-width: 768px)").matches
  addEventListener 'scroll', ->
    requestAnimationFrame ->

      transform = Math.max(window.scrollY, 0)
      transform = transform * ratio
      transform = Math.max(transform, threshhold)

      header.style.webkitTransform = "translateY(" + transform + "px)";
      header.style.transform = "translateY(" + transform + "px)";

      if window.scrollY * ratio <= threshhold then header.classList.add('pinned') else header.classList.remove('pinned')




document.documentElement.addEventListener 'click', (event)->
  # new_page_flag is true if mavigating to new page so content fades out
  # if anchor is a mailto: link, then page is not flagged to fade out
  new_page_flag = if /mailto:/i.test(event.target.href) then false else true

window.addEventListener 'beforeunload', ->
  if new_page_flag then fadeOutContent()
