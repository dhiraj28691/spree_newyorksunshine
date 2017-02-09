Spree::Image.class_eval do
  attachment_definitions[:attachment][:styles] = {
    :mini => '96x96>', # thumbs under image
    :small => '200x200>', # images on category view
    :product => '880x880>', # full product image
    :large => '1200x1200>' # light box image
  }

  attachment_definitions[:attachment][:url] = '/system/products/images/:id_partition/:style/:basename.:extension'
  attachment_definitions[:attachment][:path] = ':rails_root/public/system/products/images/:id_partition/:style/:basename.:extension'

end