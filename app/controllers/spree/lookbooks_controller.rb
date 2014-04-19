module Spree
  class LookbooksController < Spree::BaseController

    def index

      @lookbook = []

      # 1
      @lookbook << {
        "images" => ["http://files.human-nyc.com/newyorksunshine/assets/look-1.jpg"]
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
        "images" => ["http://files.human-nyc.com/newyorksunshine/assets/look-10.jpg"]
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


    end

  end

end