class @Draggable

  constructor: (wrapper_el, drag_toggle_el)->
    @wrapper_el = wrapper_el
    @draggables = @wrapper_el.children
    @drag_toggle_el = drag_toggle_el

    @drag_toggle_el.addEventListener 'click', @respondToClick


  respondToClick: (event)=>
    event.preventDefault()

    @wrapper_el.classList.toggle('draggable-wrapper')

    for draggable in @draggables
      draggable.draggable = if draggable.draggable then false else true
