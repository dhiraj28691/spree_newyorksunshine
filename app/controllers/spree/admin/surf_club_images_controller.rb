module Spree
  module Admin
    class SurfClubImagesController < ResourceController
      before_action :set_surf_club_image, only: [:show, :edit, :update, :destroy]

      def index
        @surf_club_images = SurfClubImage.all
      end

      def show
      end

      def new
        @surf_club_image = SurfClubImage.new
      end

      def edit
      end

      def create
        @surf_club_image = SurfClubImage.new(admin_surf_club_image_params)

        if @surf_club_image.save
          redirect_to admin_surf_club_images_path, notice: 'Surf club image was successfully created.'
        else
          render :new
        end
      end

      def update
      end

      def update_batch
        puts :surfclubimages
        params[:surfclubimages].each_with_index do |id, i|
          SurfClubImage.find(id).update_column(:position, i + 1)
        end
        render nothing: true
      end


      def sort
      end

      def destroy
        @surf_club_image.destroy
        redirect_to admin_surf_club_images_path, notice: 'Surf Club Image was successfully destroyed.'
      end


      private

      def set_surf_club_image
        @surf_club_image = SurfClubImage.find(params[:id])
      end

      def admin_surf_club_image_params
        params.require(:surf_club_image).permit!
      end

    end
  end
end