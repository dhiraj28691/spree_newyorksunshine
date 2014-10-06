//= require jquery.ui.sortable
//= require cocoon
//= require_tree .




document.addEventListener('DOMContentLoaded', function(){
// alert('wtf');


  document.querySelector('#feed_item_style_field').addEventListener('change', function(event){
    console.log(event.target.value);
    console.log(event);
  }, true);

});