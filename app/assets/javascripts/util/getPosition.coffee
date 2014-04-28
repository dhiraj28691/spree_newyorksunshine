window.getPosition = (ele)->

  x = 0
  y = 0

  while(true)
    x += ele.offsetLeft
    y += ele.offsetTop

    console.log ele, x, y

    if(ele.offsetParent == null)
      break

    ele = ele.offsetParent

  {
    x: x,
    y: y
  }