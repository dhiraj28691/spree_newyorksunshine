module Spree
  class HomeController < Spree::StoreController
    helper 'spree/products'
    respond_to :html

    def index
      @searcher = build_searcher(params)
      @products = @searcher.retrieve_products
      @taxonomies = Spree::Taxonomy.includes(root: :children)

      @feed_items = FeedItem.all

      if(params.has_key?(:ajax))
        render layout: false
      end
    end
  end
end

