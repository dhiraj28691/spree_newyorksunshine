(function(){

  var form_new_feed_item;


function ToggleHomepageItemSections(event) {
  // console.log(event);
  // console.log(new String('.' + event.target.value));


  try {
    form_feed_item.querySelector('.active').classList.remove('active');
  }
  catch(err) {
    console.log(err);
  }

  form_feed_item.querySelector('[data-type="' + event.target.value + '"]').classList.add('active')




}


function init() {

  if(document.querySelector('form.new_feed_item')) {
    form_feed_item = document.querySelector('form.new_feed_item'),
    $(form_feed_item).find('select#feed_item_category').on('change', ToggleHomepageItemSections).trigger('change');
  }

  if(document.querySelector('form.edit_feed_item')) {
    form_feed_item = document.querySelector('form.edit_feed_item'),
    $(form_feed_item).find('select#feed_item_category').on('change', ToggleHomepageItemSections).trigger('change');
  }

}


// if(location.pathname == "/admin/feed_items/new" || location.pathname == "/admin/feed_items/:id/edit")
document.addEventListener('DOMContentLoaded', init);


}).call();
