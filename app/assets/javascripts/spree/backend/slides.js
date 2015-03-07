//= require jquery
//= require jquery_ujs

function Slides() {

  Slides.prototype.index = function() {
    $('tbody.sortable').sortable({
      items: 'tr',
      update: updateSlidePositions,
      handle: '.handle'
    });
  };

  Slides.prototype.form = function() {


    $('.slide-images').sortable({
      items: '.slide-image',
      update: updateSlideImagesPositions,
      handle: '.position-handle'
    });

    $('.new-slide-image').on('click', insertNewSlideImageFields);

  };

  function updateSlidePositions(e, ui) {

    console.log($(this).sortable('serialize'));

    $.ajax({
      type: 'put',
      data: $(this).sortable('serialize'),
      dataType: 'script',
      success: function(data){
        console.log(data);
      }
    });

  }

  function updateSlideImagesPositions(e, ui) {
    console.log(window.location.pathname);


    $('input.position').each(function(index, element) {
      console.log('FML');

      $(element).attr('value', index);
    });

  }

  function insertNewSlideImageFields(event) {
    event.preventDefault();

    var timestamp_namespace = Date.now();

    $html_fragment = $('<div class="slide-image"> \
      <div class="two columns alpha position-handle">&#x2630;</div> \
      <div class="fourteen columns omega"> \
        <label for="slide_slide_images_attributes_' + timestamp_namespace + '_attachment">Attachment</label> \
        <input class="fullwidth" id="slide_slide_images_attributes_' + timestamp_namespace + '_attachment" name="slide[slide_images_attributes][' + timestamp_namespace + '][attachment]" type="file"> \
        <input class="order" id="slide_slide_images_attributes_' + timestamp_namespace + '_order" name="slide[slide_images_attributes][' + timestamp_namespace + '][order]" type="text"> \
      </div> \
    </div>');

    $html_fragment = $('\
      <div class="slide-image">\
        <input name="slide[slide_images_attributes][' + timestamp_namespace + '][_destroy]" type="hidden" value="0">\
        <input class="artist_checkbox" id="slide_slide_images_attributes_' + timestamp_namespace + '__destroy" name="slide[slide_images_attributes][' + timestamp_namespace + '][_destroy]" type="checkbox" value="1">\
        <div class="row bordery inner">\
      \
          <div class="two columns alpha position-handle ui-sortable-handle">☰</div>\
      \
          <div class="eleven columns omega">\
            <input class="position" id="slide_slide_images_attributes_' + timestamp_namespace + '_position" name="slide[slide_images_attributes][' + timestamp_namespace + '][position]" type="hidden" value="' + $('.slide-image').length + '">\
      \
            <label for="slide_slide_images_attributes_' + timestamp_namespace + '_attachment">Attachment</label>\
      \
            <input class="fullwidth" id="slide_slide_images_attributes_' + timestamp_namespace + '_attachment" name="slide[slide_images_attributes][' + timestamp_namespace + '][attachment]" type="file">\
      \
            <label class="fa fa-times" for="slide_slide_images_attributes_' + timestamp_namespace + '__destroy"> </label>\
          </div>\
      \
        </div>\
      \
      </div>\
    ');


    $('.slide-images').append($html_fragment);

    console.log($html_fragment);

  }

}

