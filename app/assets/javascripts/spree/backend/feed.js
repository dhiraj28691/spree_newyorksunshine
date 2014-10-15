http://localhost:3000/admin/feed_items



(function(){

  var $feed_items;


function init() {

  $feed_items = $('#feed-items');


  $feed_items.sortable({
    items: '.feed-item',
    update: function(e, ui) {
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
  });

}


if(location.pathname == "/admin/feed_items")
  document.addEventListener('DOMContentLoaded', init);


}).call();