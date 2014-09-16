module Spree
  module Admin
    class SlidesController < ResourceController
      before_action :set_lookbook
      before_action :set_slide, only: [:show, :edit, :update, :destroy]

      # GET /spree/admin/slides
      def index
        @slides = @lookbook.slides
      end

      # GET /spree/admin/slides/1
      def show
      end

      # GET /spree/admin/slides/new
      def new
        @slide = @lookbook.slides.build
      end

      # GET /spree/admin/slides/1/edit
      def edit
      end

      # POST /spree/admin/slides
      def create
        @slide = @lookbook.slides.build(slide_params)

        if @slide.save
          redirect_to admin_lookbook_slide_path(@lookbook, @slide), notice: 'Slide was successfully created.'
        else
          render :new
        end
      end

      # PATCH/PUT /spree/admin/slides/1
      def update
        if @slide.update(slide_params)
          redirect_to admin_lookbook_slide_path(@lookbook, @slide), notice: 'Slide was successfully updated.'
        else
          render :edit
        end
      end

      # DELETE /spree/admin/slides/1
      def destroy
        @slide.destroy
        redirect_to slides_url, notice: 'Slide was successfully destroyed.'
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_lookbook
          @lookbook = Lookbook.find(params[:lookbook_id])
        end

        def set_slide
          @slide = @lookbook.slides.find(params[:id])
        end


        # Only allow a trusted parameter "white list" through.
        def slide_params
          params.require(:slide).permit!
        end
    end
  end
end