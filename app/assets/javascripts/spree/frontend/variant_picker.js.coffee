$ ->
  if $('#variant_id').length
    new variantPicker()

class variantPicker
  constructor: ->
    @bindElements()

  bindElements: ->
    $(document).on "change", '#size', (e) =>
      if !$('.waiting').length
        $('#size').addClass('waiting')
      @updateColorPicker($('#size').val(), $('#color').val())

    $(document).on "change", '#color', (e) =>
      if !$('.waiting').length
        @updateVariantId($('#size').val(), $('#color').val())

  updateColorPicker: (size_id, color_id) ->
    $('#color option').each ->
      if $.inArray(size_id, $(@).data('sizes').split(' ')) == -1
        $(@).attr('disabled', 'disabled')
      else
        $(@).removeAttr('disabled')
      if $('#color option:selected').is('[disabled]')
        $('#color option:not([disabled])').first().val()
        $('#color').val($('#color option:not([disabled])').first().val())
    @updateVariantId($('#size').val(), $('#color').val())

  # updateSizePicker: (size_id, color_id) ->
  #   console.log "updateSizePicker"
  #   $('#size').find('option').each ->
  #     if $.inArray(color_id, $(@).data('colors').split(' ')) == -1
  #       console.log $(@).text()
  #       $(@).prop('disabled', 'disabled')
  #     else
  #       $(@).removeProp('disabled')
  #   @updateVariantId(size_id, color_id)

  updateVariantId: (size_id, color_id) ->
    $('#variant_id').val($('#variant_id option[data-size=' + size_id + '][data-color=' + color_id + ']').val())
    $('.waiting').removeClass('waiting')