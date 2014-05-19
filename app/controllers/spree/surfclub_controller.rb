module Spree
  class SurfclubController < Spree::BaseController

    def index

      @surfclub_image = "image"

      @google_maps_link = "//www.google.com/maps/place/New+York+Sunshine+Surf+Club/@40.886525,-72.390608,17z/data=!3m1!4b1!4m2!3m1!1s0x89e894c3538d803d:0x14a88b89ba80312d"

      @photos = []
      @photos << {"img_src" => "//newyorksunshine-production.s3.amazonaws.com/surf-club/5I6A0234.jpg"}
      @photos << {"img_src" => "//newyorksunshine-production.s3.amazonaws.com/surf-club/5I6A0237.jpg"}
      @photos << {"img_src" => "//newyorksunshine-production.s3.amazonaws.com/surf-club/5I6A0239.jpg"}
      @photos << {"img_src" => "//newyorksunshine-production.s3.amazonaws.com/surf-club/IMG_9510.jpg"}
      @photos << {"img_src" => "//newyorksunshine-production.s3.amazonaws.com/surf-club/IMG_9516.jpg"}
      @photos << {"img_src" => "//newyorksunshine-production.s3.amazonaws.com/surf-club/IMG_9526.jpg"}
      @photos << {"img_src" => "//newyorksunshine-production.s3.amazonaws.com/surf-club/IMG_9541.jpg"}
      @photos << {"img_src" => "//newyorksunshine-production.s3.amazonaws.com/surf-club/IMG_9546.jpg"}

    end

  end

end