module Spree
  module Admin
    class SurfClubImagesController < ResourceController
      # before_action :set_surf_club_image, only: [:show, :edit, :update, :destroy]

      def index
        @surf_club_images = SurfClubImage.all
      end

      def create
      end

      def new
      end

      def edit
      end

      def show
      end

      def update
      end

      def destroy
      end

      private

      def set_surf_club_image
      end

    end
  end
end