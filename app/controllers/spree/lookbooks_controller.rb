module Spree
  class LookbooksController < Spree::BaseController

    def index

      @lookbook = []

      @lookbook << { "image_src" => "http://apandre.files.wordpress.com/2011/03/cave.jpg" }
      @lookbook << { "image_src" => "http://fc01.deviantart.net/fs70/f/2013/281/c/d/cyber_noir_by_alexiuss-d6prx1c.jpg" }
      @lookbook << { "image_src" => "http://fc09.deviantart.net/fs71/f/2011/158/0/6/cyber_miku_domain_by_primantis-d3ibzjx.png" }
      @lookbook << { "image_src" => "http://sciencelakes.com/data_images/out/33/8878261-space-sparkling-stars.jpg" }
      @lookbook << { "image_src" => "http://sciencelakes.com/data_images/out/33/8878354-space-stars-nebulae.jpg" }
      @lookbook << { "image_src" => "http://www.wallpapersat.com/wallpapers/2013/03/Keira-Knightley-Shirt-1200x1920.jpg" }
      @lookbook << { "image_src" => "http://www.wallseemly.com/wallpapers/2013/04/Yves-larock-man-t-shirt-hands-face-1200x1920.jpg" }
      @lookbook << { "image_src" => "http://drtech.bangordailynews.com/files/2013/10/bigdata.jpg" }
      @lookbook << { "image_src" => "http://www.sexyli.com/wp-content/uploads/2013/06/Ansel-Adams-Wallpapers-2.jpg" }
      @lookbook << { "image_src" => "http://thejosevilson.com/wp-content/uploads/2013/06/lionroarbw.jpg" }
      @lookbook << { "image_src" => "http://images.mmorpg.com/images/galleries/full/182010/d6cf5033-4368-4d75-85da-2d22dc4c1c43.jpg" }
      @lookbook << { "image_src" => "http://www.modernwallstreet.com/wp-content/uploads/2013/11/new-york-aerial-view-in-black-and-white-wallpaper.jpg" }
      @lookbook << { "image_src" => "http://toptravellists.net/wallpapers/2012/10/Central-Park-Photo-New-York-City-United-States-1200x1920.jpg" }
      @lookbook << { "image_src" => "http://toptravellists.net/wallpapers/2013/01/Old-Cairo-Egypt-1200x1920.jpg" }


    end

  end

end