module Spree
  class SurfclubController < Spree::BaseController

    def index

      @google_maps_link = "//www.google.com/maps/place/New+York+Sunshine+Surf+Club/@40.886525,-72.390608,17z/data=!3m1!4b1!4m2!3m1!1s0x89e894c3538d803d:0x14a88b89ba80312d"

      @surf_club_images = Spree::SurfClubImage.all

    end

  end

end