function Feed(){

  var form_feed_item;

  Feed.prototype.new = function() {

    if(document.querySelector('form.new_feed_item')) {
      form_feed_item = document.querySelector('form.new_feed_item'),
      $(form_feed_item).find('select#feed_item_category').on('change', toggleHomepageItemSections);
    }

  };

  Feed.prototype.edit = function() {

    if(document.querySelector('form.edit_feed_item')) {
      form_feed_item = document.querySelector('form.edit_feed_item'),
      $(form_feed_item).find('select#feed_item_category').on('change', toggleHomepageItemSections).trigger('change');
    }

  }

  function toggleHomepageItemSections(event) {
    // console.log(event);
    // console.log(new String('.' + event.target.value));


    try {
      form_feed_item.querySelector('.active').classList.remove('active');
    }
    catch(err) {
      console.log(err);
    }

    var selector = '[data-type="' + event.target.value + '"]';
    console.log(selector);
    form_feed_item.querySelector(selector).classList.add('active')




  }

}