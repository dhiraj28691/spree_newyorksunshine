class @Draggable

  constructor: (wrapper_el, drag_toggle_el)->
    @wrapper_el = wrapper_el
    @draggables = @wrapper_el.children
    @drag_toggle_el = drag_toggle_el

    @drag_toggle_el.addEventListener 'click', @respondToClick

    console.log wrapper_el, drag_toggle_el




  respondToClick: (event)=>
    event.preventDefault()
    console.log event
    @wrapper_el.classList.toggle('draggable-wrapper')

    for draggable in @draggables
      draggable.draggable = if draggable.draggable then false else true
