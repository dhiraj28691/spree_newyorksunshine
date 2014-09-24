module Spree
  class LookbooksController < Spree::BaseController

    before_action :set_lookbooks

    def index
    end

    def show_old
      @lookbook = []

      # 1
      @lookbook << {
        "images" => ["//newyorksunshine-production.s3.amazonaws.com/lookbook/ss14/look-1.jpg"]
      }

      # 2
      @lookbook << {
        "images" => ["//newyorksunshine-production.s3.amazonaws.com/lookbook/ss14/look-2.1.jpg", "//newyorksunshine-production.s3.amazonaws.com/lookbook/ss14/look-2.2.jpg"]
      }

      # 3
      @lookbook << {
        "images" => ["//newyorksunshine-production.s3.amazonaws.com/lookbook/ss14/look-3.1.jpg", "//newyorksunshine-production.s3.amazonaws.com/lookbook/ss14/look-3.2.jpg"]
      }

      # 4
      @lookbook << {
        "images" => ["//newyorksunshine-production.s3.amazonaws.com/lookbook/ss14/look-4.1.jpg", "//newyorksunshine-production.s3.amazonaws.com/lookbook/ss14/look-4.2.jpg"]
      }

      # 5
      @lookbook << {
        "images" => ["//newyorksunshine-production.s3.amazonaws.com/lookbook/ss14/look-5.1.jpg", "//newyorksunshine-production.s3.amazonaws.com/lookbook/ss14/look-5.2.jpg"]
      }

      # 6
      @lookbook << {
        "images" => ["//newyorksunshine-production.s3.amazonaws.com/lookbook/ss14/look-6.1.jpg", "//newyorksunshine-production.s3.amazonaws.com/lookbook/ss14/look-6.2.jpg"]
      }

      # 7
      @lookbook << {
        "images" => ["//newyorksunshine-production.s3.amazonaws.com/lookbook/ss14/look-7.jpg"]
      }

      # 8
      @lookbook << {
        "images" => ["//newyorksunshine-production.s3.amazonaws.com/lookbook/ss14/look-8.1.jpg", "//newyorksunshine-production.s3.amazonaws.com/lookbook/ss14/look-8.2.jpg"]
      }

      # 9
      @lookbook << {
        "images" => ["//newyorksunshine-production.s3.amazonaws.com/lookbook/ss14/look-9.1.jpg", "//newyorksunshine-production.s3.amazonaws.com/lookbook/ss14/look-9.2.jpg"]
      }

      # 10
      @lookbook << {
        "images" => ["//newyorksunshine-production.s3.amazonaws.com/lookbook/ss14/look-10.jpg"]
      }

      # 11
      @lookbook << {
        "images" => ["//newyorksunshine-production.s3.amazonaws.com/lookbook/ss14/look-11.1.jpg", "//newyorksunshine-production.s3.amazonaws.com/lookbook/ss14/look-11.2.jpg"]
      }

      # 12
      @lookbook << {
        "images" => ["//newyorksunshine-production.s3.amazonaws.com/lookbook/ss14/look-12.1.jpg", "//newyorksunshine-production.s3.amazonaws.com/lookbook/ss14/look-12.2.jpg"]
      }

      # 13
      @lookbook << {
        "images" => ["//newyorksunshine-production.s3.amazonaws.com/lookbook/ss14/look-13.1.jpg", "//newyorksunshine-production.s3.amazonaws.com/lookbook/ss14/look-13.2.jpg"]
      }

      # 14
      @lookbook << {
        "images" => ["//newyorksunshine-production.s3.amazonaws.com/lookbook/ss14/look-14.1.jpg", "//newyorksunshine-production.s3.amazonaws.com/lookbook/ss14/look-14.2.jpg"]
      }
    end

    def show
      @lookbook = Lookbook.friendly.find(params[:id])

      # @lookbook.slide_images

    end

    private

    def set_lookbooks
      @lookbooks = Lookbook.all
    end

  end

end