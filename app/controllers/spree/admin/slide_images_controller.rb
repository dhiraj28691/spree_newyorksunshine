module Spree
  module Admin
    class SlideImagesController < ResourceController

      before_action :set_slide, only: [:index, :new, :create]
      before_action :set_slide_image, only: [:edit]
      before_action :set_lookbook,    only: [:index]


      def index
      end

      def show
      end

      def new
        @action = [:admin, @slide, @slide.slide_images.build]
      end

      def edit
        @action = [:admin, @slide_image]
      end

      def create
        @slide_image = @slide.slide_images.build(slide_image_params)

        respond_to do |format|
          if @slide_image.save
            format.html { redirect_to admin_slide_slide_images_path(@slide), notice: "Image was successfully created." }
            format.json { render action: 'show', status: :created, location: @slide_image}
          else
            format.html { render action: 'new' }
            format.json { render json: @slide_image.errors, status: :unprocessable_entity }
          end
        end
      end

      def update
        respond_to do |format|
          if @slide_image.update(slide_image_params)
            format.html { redirect_to admin_slide_slide_images_path(@slide_image.slide), notice: 'Image was successfully updated.' }
            format.json { head :no_content }
          else
            format.html { render action: 'edit' }
            format.json { render json: @slide_image.errors, status: :unprocessable_entity }
          end
        end
      end

      private

      def set_slide
        @slide = Slide.find(params[:slide_id])
      end

      def set_slide_image
        @slide_image = SlideImage.find(params[:id])
      end

      def set_lookbook
        # binding.pry
        @lookbook = @slide.lookbook
      end

      def slide_image_params
        params.require(:slide_image).permit!
      end

    end
  end
end