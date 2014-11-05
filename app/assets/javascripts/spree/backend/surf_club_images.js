(function(){

  var $surf_club_images;


  function init() {

    $surf_club_images = $('#surf-club-images');

    $surf_club_images.sortable({
      items: '.surf-club-image',
      update: function(e, ui) {
        // console.log($(this).sortable('serialize'));

        $.ajax({
          type: 'put',
          data: $(this).sortable('serialize'),
          dataType: 'script',
          success: function(data){
            console.log(data);
          }
        });

      }
    });

    console.log('tings', $surf_club_images);

  }


if(location.pathname == "/admin/surf_club_images")
  document.addEventListener('DOMContentLoaded', init);


}).call();