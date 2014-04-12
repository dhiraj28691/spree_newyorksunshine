module Spree
  class LookbooksController < Spree::BaseController

    def index

      @lookbook = []

      # 1
      @lookbook << {
        "images" => ["http://files.human-nyc.com/newyorksunshine/assets/look-1.jpg"],
        "description" => '<p>2014<br>New York Sunshine<br><a href="http://newyorksunshine.com/" target="_blank">newyorksunshine.com</a></p><p>For wholesale inquiries<br><a href="mailto:info@newyorksunshine.com">info@newyorksunshine.com</a></p><p>Flagship Location<br><address>28 Nugent Street<br>Southampton, NY 11968</address><p>Design / Photography by William Kaner</p>'
      }

      # 2
      @lookbook << {
        "images" => ["http://files.human-nyc.com/newyorksunshine/assets/look-2.1.jpg", "http://files.human-nyc.com/newyorksunshine/assets/look-2.2.jpg"]
      }

      # 3
      @lookbook << {
        "images" => ["http://files.human-nyc.com/newyorksunshine/assets/look-3.1.jpg", "http://files.human-nyc.com/newyorksunshine/assets/look-3.2.jpg"]
      }

      # 4
      @lookbook << {
        "images" => ["http://files.human-nyc.com/newyorksunshine/assets/look-4.1.jpg", "http://files.human-nyc.com/newyorksunshine/assets/look-4.2.jpg"]
      }

      # 5
      @lookbook << {
        "images" => ["http://files.human-nyc.com/newyorksunshine/assets/look-5.1.jpg", "http://files.human-nyc.com/newyorksunshine/assets/look-5.2.jpg"]
      }

      # 6
      @lookbook << {
        "images" => ["http://files.human-nyc.com/newyorksunshine/assets/look-6.1.jpg", "http://files.human-nyc.com/newyorksunshine/assets/look-6.2.jpg"]
      }

      # 7
      @lookbook << {
        "images" => ["http://files.human-nyc.com/newyorksunshine/assets/look-7.jpg"]
      }

      # 8
      @lookbook << {
        "images" => ["http://files.human-nyc.com/newyorksunshine/assets/look-8.1.jpg", "http://files.human-nyc.com/newyorksunshine/assets/look-8.2.jpg"]
      }

      # 9
      @lookbook << {
        "images" => ["http://files.human-nyc.com/newyorksunshine/assets/look-9.1.jpg", "http://files.human-nyc.com/newyorksunshine/assets/look-9.2.jpg"]
      }

      # 10
      @lookbook << {
        "images" => ["http://files.human-nyc.com/newyorksunshine/assets/look-10.1.jpg", "http://files.human-nyc.com/newyorksunshine/assets/look-10.2.jpg"]
      }

      # 11
      @lookbook << {
        "images" => ["http://files.human-nyc.com/newyorksunshine/assets/look-11.1.jpg", "http://files.human-nyc.com/newyorksunshine/assets/look-11.2.jpg"]
      }

      # 12
      @lookbook << {
        "images" => ["http://files.human-nyc.com/newyorksunshine/assets/look-12.1.jpg", "http://files.human-nyc.com/newyorksunshine/assets/look-12.2.jpg"]
      }

      # 13
      @lookbook << {
        "images" => ["http://files.human-nyc.com/newyorksunshine/assets/look-13.1.jpg", "http://files.human-nyc.com/newyorksunshine/assets/look-13.2.jpg"]
      }

      # 14
      @lookbook << {
        "images" => ["http://files.human-nyc.com/newyorksunshine/assets/look-14.1.jpg", "http://files.human-nyc.com/newyorksunshine/assets/look-14.2.jpg"]
      }

      # @lookbook << { "images_src" => "http://fc01.deviantart.net/fs70/f/2013/281/c/d/cyber_noir_by_alexiuss-d6prx1c.jpg" }
      # @lookbook << { "images_src" => "http://fc09.deviantart.net/fs71/f/2011/158/0/6/cyber_miku_domain_by_primantis-d3ibzjx.png" }
      # @lookbook << { "images_src" => "http://sciencelakes.com/data_images/out/33/8878261-space-sparkling-stars.jpg" }
      # @lookbook << { "images_src" => "http://sciencelakes.com/data_images/out/33/8878354-space-stars-nebulae.jpg" }
      # @lookbook << { "images_src" => "http://www.wallpapersat.com/wallpapers/2013/03/Keira-Knightley-Shirt-1200x1920.jpg" }
      # @lookbook << { "images_src" => "http://www.wallseemly.com/wallpapers/2013/04/Yves-larock-man-t-shirt-hands-face-1200x1920.jpg" }
      # @lookbook << { "images_src" => "http://drtech.bangordailynews.com/files/2013/10/bigdata.jpg" }
      # @lookbook << { "images_src" => "http://www.sexyli.com/wp-content/uploads/2013/06/Ansel-Adams-Wallpapers-2.jpg" }
      # @lookbook << { "images_src" => "http://thejosevilson.com/wp-content/uploads/2013/06/lionroarbw.jpg" }
      # @lookbook << { "images_src" => "http://images.mmorpg.com/images/galleries/full/182010/d6cf5033-4368-4d75-85da-2d22dc4c1c43.jpg" }
      # @lookbook << { "images_src" => "http://www.modernwallstreet.com/wp-content/uploads/2013/11/new-york-aerial-view-in-black-and-white-wallpaper.jpg" }
      # @lookbook << { "images_src" => "http://toptravellists.net/wallpapers/2012/10/Central-Park-Photo-New-York-City-United-States-1200x1920.jpg" }
      # @lookbook << { "images_src" => "http://toptravellists.net/wallpapers/2013/01/Old-Cairo-Egypt-1200x1920.jpg" }


    end

  end

end