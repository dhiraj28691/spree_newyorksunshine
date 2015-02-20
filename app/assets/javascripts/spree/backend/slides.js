//= require jquery
//= require jquery_ujs


function Slides() {

  Slides.prototype.form = function() {

    $('.slide-images').sortable({
      items: '.slide-image',
      update: updateSlideImagesPositions,
      handle: '.position-handle'
    });

    $('.new-slide-image').on('click', insertNewSlideImageFields);

  };

  function updateSlideImagesPositions(e, ui) {

    $('input.order').each(function(index, element) {
      $(element).attr('value', index + 1);
    });

  }

  function insertNewSlideImageFields(event) {
    event.preventDefault();

    var timestamp_namespace = Date.now();

    $html_fragment = $('<div class="row bordery ui-sortable-handle"> \
      <div class="two columns alpha position-handle">&#x2630;</div> \
      <div class="fourteen columns omega"> \
        <label for="slide_slide_images_attributes_' + timestamp_namespace + '_attachment">Attachment</label> \
        <input class="fullwidth" id="slide_slide_images_attributes_' + timestamp_namespace + '_attachment" name="slide[slide_images_attributes][' + timestamp_namespace + '][attachment]" type="file"> \
        <input class="order" id="slide_slide_images_attributes_' + timestamp_namespace + '_order" name="slide[slide_images_attributes][' + timestamp_namespace + '][order]" type="text"> \
      </div> \
    </div>');

    $('.slide-images').append($html_fragment);

    console.log($html_fragment);

  }

}