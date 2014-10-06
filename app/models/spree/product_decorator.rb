Spree::Product.class_eval do
  has_many :feed_items, :class_name => "Spree::Product"
end