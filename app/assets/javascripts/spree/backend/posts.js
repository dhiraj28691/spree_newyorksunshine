function Posts() {

  Posts.prototype.form = function() {

    $('#post_image').sortable({
      update: updatePositionFields
    });

  };

  function updatePositionFields(e, ui) {
    console.log(this);

    $(this).find('.nested-fields').each(function(idx, el) {
      $(el).find('.position').attr('value', idx);
    });
  }

}

