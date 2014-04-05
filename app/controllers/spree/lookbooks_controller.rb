module Spree
  class LookbooksController < Spree::BaseController

    # layout 'spree_application'

    def index

      @lookbook = []

      @lookbook << { "image_src" => "http://images5.fanpop.com/image/photos/30900000/Twice-as-bright-half-as-long-blade-runner-30923440-1920-1200.jpg" }
      @lookbook << { "image_src" => "http://fc09.deviantart.net/fs71/f/2011/158/0/6/cyber_miku_domain_by_primantis-d3ibzjx.png" }
      @lookbook << { "image_src" => "http://sciencelakes.com/data_images/out/33/8878261-space-sparkling-stars.jpg" }
      @lookbook << { "image_src" => "http://sciencelakes.com/data_images/out/33/8878354-space-stars-nebulae.jpg" }
      @lookbook << { "image_src" => "http://img.wallpaperstock.net:81/night-stars-ocean--couple-wallpapers_40919_1920x1200.jpg" }

    end

  end

end