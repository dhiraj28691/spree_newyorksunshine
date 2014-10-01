#= require util/draggable

class Stockists
  constructor: ->
    draggable_toggle_el = document.querySelector('.drag-toggle a')

    drag_groups = document.querySelectorAll('tbody')

    $(drag_groups).each ->
      $(@).sortable
        items: '.sortable-item',
        placeholder: 'ui-state-highlight'
        start: (e, ui) ->
          console.log 'started'
          this.setAttribute('data-state', 'started')
        stop: (e, ui) ->
          console.log 'stopped'
          this.setAttribute('data-state', 'stopped')
        update: (e, ui) ->
          # $(@).find('.sortable-item').each (index, e) ->
          #   $(@).find('.position input').val(index + 1)

          console.log $(@).sortable('serialize')
          console.log $(@).data('sort')

          $.ajax
            type: 'put'
            data: $(@).sortable('serialize')
            dataType: 'script'
            url: $(@).data('sort')
            success: ->
              $(document).trigger('sortables:updated')





    # for drag_group in drag_groups
      # console.log 'hi hi'

      # $(drag_group).sortable()

      # new Draggable(drag_group, draggable_toggle_el)



document.addEventListener 'DOMContentLoaded', ->
  if(location.pathname == "/admin/stockists")
    stockists = new Stockists()