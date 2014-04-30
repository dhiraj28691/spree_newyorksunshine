module Spree
  class HomeController < Spree::StoreController
    helper 'spree/products'
    respond_to :html

    def index
      @searcher = build_searcher(params)
      @products = @searcher.retrieve_products
      @taxonomies = Spree::Taxonomy.includes(root: :children)


      @full_bleed = [
        {
          :cta_category => "Shop",
          :cta_predicate => "Surf Club Jersey",
          :href => "//newyorksunshine.human-nyc.com/products/surf-club-jersey",
          :image_src => "//files.human-nyc.com/newyorksunshine/assets/home/home-0445.jpg"
        },
        {
          :cta_category => "Shop",
          :cta_predicate => "Surf Club Jersey",
          :href => "//newyorksunshine.human-nyc.com/products/surf-club-jersey",
          :image_src => "//files.human-nyc.com/newyorksunshine/assets/home/home-0453.jpg"
        },
        {
          :cta_category => "Shop",
          :cta_predicate => "NYS Script Tank",
          :href => "//newyorksunshine.human-nyc.com/products/nys-script-tank",
          :image_src => "//files.human-nyc.com/newyorksunshine/assets/home/home-0557.jpg"
        },
        {
          :cta_category => "Shop",
          :cta_predicate => "NY Flag Tank",
          :href => "//newyorksunshine.human-nyc.com/products/ny-flag-tank",
          :image_src => "//files.human-nyc.com/newyorksunshine/assets/home/home-0577.jpg"
        },
        {
          :cta_category => "Shop",
          :cta_predicate => "Hoop Pocket Tee",
          :href => "//newyorksunshine.human-nyc.com/products/hoop-pocket-tee",
          :image_src => "//files.human-nyc.com/newyorksunshine/assets/home/home-0621.jpg"
        },
        {
          :cta_category => "Shop",
          :cta_predicate => "Surf Club Tee",
          :href => "//newyorksunshine.human-nyc.com/products/surf-club-tee",
          :image_src => "//files.human-nyc.com/newyorksunshine/assets/home/home-0707.jpg"
        },
        {
          :cta_category => "Shop",
          :cta_predicate => "Hoop Dreams Tee",
          :href => "//newyorksunshine.human-nyc.com/products/hoop-dreams-tee",
          :image_src => "//files.human-nyc.com/newyorksunshine/assets/home/home-0922.jpg"
        },
        {
          :cta_category => "Shop",
          :cta_predicate => "Money Bag Tee",
          :href => "//newyorksunshine.human-nyc.com/products/money-bag-tee",
          :image_src => "//files.human-nyc.com/newyorksunshine/assets/home/home-1273.jpg"
        },
        {
          :image_src => "//files.human-nyc.com/newyorksunshine/assets/home/home-2976.jpg"
        },
        {
          :image_src => "//files.human-nyc.com/newyorksunshine/assets/home/home-3030.jpg"
        },
        {
          :cta_category => "Shop",
          :cta_predicate => "Hoop Dreams Tee",
          :href => "/products",
          :image_src => "//files.human-nyc.com/newyorksunshine/assets/home/home-3128.jpg"
        },
        {
          :cta_category => "Shop",
          :cta_predicate => "Hoop Dreams Tee",
          :href => "/products",
          :image_src => "//files.human-nyc.com/newyorksunshine/assets/home/home-3204.jpg"
        },
        {
          :cta_category => "Shop",
          :cta_predicate => "Hoop Dreams Tee",
          :href => "/products",
          :image_src => "//files.human-nyc.com/newyorksunshine/assets/home/home-3455.jpg"
        },
        {
          :cta_category => "Shop",
          :cta_predicate => "Hoop Dreams Tee",
          :href => "/products",
          :image_src => "//files.human-nyc.com/newyorksunshine/assets/home/home-3760.jpg"
        },
        {
          :cta_category => "Shop",
          :cta_predicate => "Hoop Dreams Tee",
          :href => "/products",
          :image_src => "//files.human-nyc.com/newyorksunshine/assets/home/home-3821.jpg"
        },
        {
          :cta_category => "Shop",
          :cta_predicate => "Hoop Dreams Tee",
          :href => "/products",
          :image_src => "//files.human-nyc.com/newyorksunshine/assets/home/home-4279.jpg"
        },
        {
          :cta_category => "Shop",
          :cta_predicate => "Hoop Dreams Tee",
          :href => "/products",
          :image_src => "//files.human-nyc.com/newyorksunshine/assets/home/home-5047.jpg"
        },
        {
          :cta_category => "Shop",
          :cta_predicate => "Hoop Dreams Tee",
          :href => "/products",
          :image_src => "//files.human-nyc.com/newyorksunshine/assets/home/home-5885.jpg"
        },
        {
          :cta_category => "Shop",
          :cta_predicate => "Hoop Dreams Tee",
          :href => "/products",
          :image_src => "//files.human-nyc.com/newyorksunshine/assets/home/home-8512.jpg"
        },
        {
          :cta_category => "Shop",
          :cta_predicate => "Hoop Dreams Tee",
          :href => "/products",
          :image_src => "//files.human-nyc.com/newyorksunshine/assets/home/home-9669.jpg"
        },
        {
          :cta_category => "Shop",
          :cta_predicate => "Hoop Dreams Tee",
          :href => "/products",
          :image_src => "//files.human-nyc.com/newyorksunshine/assets/home/home-183775_6_x01.jpg"
        }
      ]






      if(params.has_key?(:ajax))
        render :layout => false
      end

    end

  end
end
