
"use strict"

window.scrollTo = (scrollTop, duration)->
  scrollTop = scrollTop || 0
  # console.log scrollTop, duration
  start = Math.max(document.documentElement.scrollTop, document.body.scrollTop)
  change = scrollTop - start
  initialTime = Date.now()
  finalTime = initialTime + duration

  # exit out if already scrolled to top
  if change == 0 then return

  animateScroll = ->
    currentTime = Date.now()
    val = Math.easeInOutQuad(currentTime - initialTime, start, change, duration)

    # element.scrollTop = val

    document.documentElement.scrollTop = val
    document.body.scrollTop = val

    if currentTime < finalTime then requestAnimationFrame(animateScroll)

  animateScroll()