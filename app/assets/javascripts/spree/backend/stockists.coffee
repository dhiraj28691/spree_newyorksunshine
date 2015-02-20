
class Stockists
  constructor: ->
    draggable_toggle_el = document.querySelector('.drag-toggle a')

    drag_groups = document.querySelectorAll('tbody')

    $(drag_groups).each ->
      $(@).sortable
        items: '.sortable-item',
        placeholder: 'ui-state-highlight'
        start: (e, ui) ->
          this.setAttribute('data-state', 'started')
        stop: (e, ui) ->
          this.setAttribute('data-state', 'stopped')
        update: (e, ui) ->
          $.ajax
            type: 'put'
            data: $(@).sortable('serialize')
            dataType: 'script'
            url: $(@).data('sort')
            success: ->
              $(document).trigger('sortables:updated')

document.addEventListener 'DOMContentLoaded', ->
  if(location.pathname == "/admin/stockists")
    stockists = new Stockists()