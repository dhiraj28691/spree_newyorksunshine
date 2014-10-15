# $ ->
#   if $('.sortable').length
#     new SortableBehavior()

# class SortableBehavior
#   constructor: ->
#     setup()

#   setup = ->
#     $('.sortable').each ->
#       $(@).sortable
#         items: '.sortable-item',
#         placeholder: 'ui-state-highlight'
#         update: (e, ui) ->
#           $(@).find('.sortable-item').each (index, e) ->
#             $(@).find('.position input').val(index + 1)
