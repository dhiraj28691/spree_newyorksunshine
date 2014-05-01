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
          :cta_predicate => "Hoop Pocket Tee",
          :href => "/products/hoop-pocket-tee",
          :image_src => "//newyorksunshine-production.s3.amazonaws.com/home/2014/BBall_Standing_Slow.gif"
        },
        {
          :cta_category => "Shop",
          :cta_predicate => "Surf Club Jersey",
          :href => "/products/surf-club-jersey",
          :image_src => "//newyorksunshine-production.s3.amazonaws.com/home/2014/Hoop%20Pocket%20Tee.jpg"
        },
        {
          :cta_category => "Shop",
          :cta_predicate => "Hoop Pocket Tee",
          :href => "/products/hoop-pocket-tee",
          :image_src => "//newyorksunshine-production.s3.amazonaws.com/home/2014/hoops.jpg"
        },
        #### ROW 2 ####
        {
          :cta_category => "Shop",
          :cta_predicate => "Scallop Tee",
          :href => "/products/scallop-tee",
          :image_src => "//newyorksunshine-production.s3.amazonaws.com/home/2014/scallop.jpg"
        },
        {
          :cta_category => "Shop",
          :cta_predicate => "Surf Club Jersey",
          :href => "/products/surf-club-jersey",
          :image_src => "//newyorksunshine-production.s3.amazonaws.com/home/2014/home-0453_b&w.jpg"
        },
        {
          :cta_category => "Shop",
          :cta_predicate => "Live that Life Hat",
          :href => "/products/live-that-life-corduroy-hat",
          :image_src => "//newyorksunshine-production.s3.amazonaws.com/home/2014/live_that_life.jpg"
        },
        #### ROW 3 ####
        {
          :cta_category => "Shop",
          :cta_predicate => "",
          :href => "/products",
          :image_src => "//newyorksunshine-production.s3.amazonaws.com/home/2014/surf1.jpg"
        },
        {
          :cta_category => "Shop",
          :cta_predicate => "Hoop Dreams Tee",
          :href => "/products/hoop-dreams-tee",
          :image_src => "//newyorksunshine-production.s3.amazonaws.com/home/2014/hoopdreams.jpg"
        },
        {
          :cta_category => "Shop",
          :cta_predicate => "Stickball Raglan",
          :href => "//newyorksunshine.human-nyc.com/products/stickball-raglan",
          :image_src => "//newyorksunshine-production.s3.amazonaws.com/home/2014/Bat.gif"
        },
        #### ROW 4 ####
        {
          :cta_category => "Shop",
          :cta_predicate => "Big Apple Button Down",
          :href => "//newyorksunshine.human-nyc.com/products/big-apple-button-down",
          :image_src => "//newyorksunshine-production.s3.amazonaws.com/home/2014/appleshirt.jpg"
        },
        {
          :cta_category => "Shop",
          :cta_predicate => "NY Flag Tank",
          :href => "//newyorksunshine.human-nyc.com/products/ny-flag-tank",
          :image_src => "//newyorksunshine-production.s3.amazonaws.com/home/2014/ny-flag-tank.jpg"
        },
        {
          :cta_category => "Shop",
          :cta_predicate => "NYS Script Tank",
          :href => "//newyorksunshine.human-nyc.com/products/nys-script-tank",
          :image_src => "//newyorksunshine-production.s3.amazonaws.com/home/2014/nys-script-tank.jpg"
        },
      ]

      if(params.has_key?(:ajax))
        render :layout => false
      end

    end

  end
end
