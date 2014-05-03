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
          :image_src => "//newyorksunshine-production.s3.amazonaws.com/home/2014/surf-club-jersey.jpg"
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
          :image_src => "//newyorksunshine-production.s3.amazonaws.com/home/2014/scallop-tee.jpg"
        },
        {
          :cta_category => "Shop",
          :cta_predicate => "Surf Club Jersey",
          :href => "/products/surf-club-jersey",
          :image_src => "//newyorksunshine-production.s3.amazonaws.com/home/2014/home-0453_b&w.jpg"
        },
        {
          :cta_category => "Shop",
          :cta_predicate => "Times Square Hat",
          :href => "/products/times-square-hat",
          :image_src => "//newyorksunshine-production.s3.amazonaws.com/home/2014/times-square-hat.jpg"
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
          :image_src => "//newyorksunshine-production.s3.amazonaws.com/home/2014/hoop-dreams-tee.jpg"
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
          :cta_predicate => "Surf Club Zip Up",
          :href => "//newyorksunshine.human-nyc.com/products/surf-club-zip-up",
          :image_src => "//newyorksunshine-production.s3.amazonaws.com/home/2014/ZipHoodie.gif"
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
        #### ROW 5 ####
        {
          :cta_category => "Shop",
          :cta_predicate => "Meadow Club Polo",
          :href => "//newyorksunshine.human-nyc.com/products/meadow-club-polo",
          :image_src => "//newyorksunshine-production.s3.amazonaws.com/home/2014/Tennis.gif"
        },
        {
          :cta_category => "Shop",
          :cta_predicate => "Hawaiian Board Short",
          :href => "//newyorksunshine.human-nyc.com/products/hawaiian-board-short",
          :image_src => "//newyorksunshine-production.s3.amazonaws.com/home/2014/hawaiian-board-short.jpg"
        },
        {
          :cta_category => "Shop",
          :cta_predicate => "",
          :href => "//newyorksunshine.human-nyc.com/products",
          :image_src => "//newyorksunshine-production.s3.amazonaws.com/home/2014/wave.jpg"
        },
        #### ROW 6 ####
        # Row 6: navajo socks, home-0621_b&w.jpg, Black NY Flag Tee
        {
          :cta_category => "Shop",
          :cta_predicate => "Navajo Socks",
          :href => "//newyorksunshine.human-nyc.com/products/navajo-socks",
          :image_src => "//newyorksunshine-production.s3.amazonaws.com/home/2014/navajo-socks.jpg"
        },
        {
          :cta_category => "Shop",
          :cta_predicate => "Hoop Pocket Tee",
          :href => "//newyorksunshine.human-nyc.com/products/hoop-pocket-tee",
          :image_src => "//newyorksunshine-production.s3.amazonaws.com/home/2014/hoop-pocket-tee-row-6.jpg"
        },
        {
          :cta_category => "Shop",
          :cta_predicate => "New York Flag Tee",
          :href => "//newyorksunshine.human-nyc.com/products/new-york-flag-tee",
          :image_src => "//newyorksunshine-production.s3.amazonaws.com/home/2014/black-new-york-flag-tee.jpg"
        },
        #### ROW 7 ####
        # Row 7: home-8512_b&w.jpg, hawaiian button down, home-3821_b&w.jpg
        {
          :cta_category => "Shop",
          :cta_predicate => "",
          :href => "//newyorksunshine.human-nyc.com/products",
          :image_src => "//newyorksunshine-production.s3.amazonaws.com/home/2014/home-8512_b&w.jpg"
        },
        {
          :cta_category => "Shop",
          :cta_predicate => "Island Button Down",
          :href => "//newyorksunshine.human-nyc.com/products/island-button-down",
          :image_src => "//newyorksunshine-production.s3.amazonaws.com/home/2014/island-button-down.jpg"
        },
        {
          :cta_category => "Shop",
          :cta_predicate => "",
          :href => "//newyorksunshine.human-nyc.com/products",
          :image_src => "//newyorksunshine-production.s3.amazonaws.com/home/2014/home-3821_b&w.jpg"
        },
        #### ROW 8 ####
        # Row 8: black Big Apple Hat, home-3204_b&w.jpg, Big Apple Button Down
        {
          :cta_category => "Shop",
          :cta_predicate => "Big Apple Hat",
          :href => "//newyorksunshine.human-nyc.com/products/big-apple-hat",
          :image_src => "//newyorksunshine-production.s3.amazonaws.com/home/2014/big-apple-hat.jpg"
        },
        {
          :cta_category => "Shop",
          :cta_predicate => "",
          :href => "//newyorksunshine.human-nyc.com/products",
          :image_src => "//newyorksunshine-production.s3.amazonaws.com/home/2014/home-3204_b&w.jpg"
        },
        {
          :cta_category => "Shop",
          :cta_predicate => "Big Apple Button Down",
          :href => "//newyorksunshine.human-nyc.com/products/big-apple-button-down",
          :image_src => "//newyorksunshine-production.s3.amazonaws.com/home/2014/big-apple-button-down.jpg"
        },
      ]

      if(params.has_key?(:ajax))
        render :layout => false
      end

    end

  end
end
