module Spree
  module Admin
    class SlidesController < ResourceController
      before_action :set_lookbook, only: [:index, :new, :create, :update, :destroy]
      before_action :set_slide, only: [:show, :edit, :update, :destroy]
      before_action :build_layouts_selects, only: [:new, :edit]

      # GET /spree/admin/slides
      def index
        @lookbook = Lookbook.find(params[:lookbook_id])
        @slides = @lookbook.slides
      end

      # GET /spree/admin/slides/1
      def show
      end

      # GET /spree/admin/slides/new
      def new
        @slide = @lookbook.slides.build
        # 3.times { @slide.slide_images.build }

      end

      # GET /spree/admin/slides/1/edit
      def edit
        @lookbook = @slide.lookbook

        # binding.pry
      end

      # POST /spree/admin/slides
      def create
        @slide = @lookbook.slides.build(slide_params)

        if @slide.save
          redirect_to admin_lookbook_slides_url(@lookbook), notice: 'Slide was successfully created.'
        else
          render :new
        end
      end

      # PATCH/PUT /spree/admin/slides/1
      def update
        # binding.pry
        if @slide.update(slide_params)
          redirect_to admin_lookbook_slides_url(@lookbook), notice: 'Slide was successfully updated.'
        else
          render :edit
        end
      end

      def update_batch
        params[:slide].each_with_index do |id, index|
          Slide.find(id).update_column(:position, index)
        end
        render nothing: true
      end

      # DELETE /spree/admin/slides/1
      def destroy
        @slide.destroy
        redirect_to admin_lookbook_slides_url(@lookbook), notice: 'Slide was successfully destroyed.'
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_lookbook
          @lookbook = Lookbook.find(params[:lookbook_id])
        end

        def set_slide
          @slide = Slide.find(params[:id])
        end

        def build_layouts_selects
          @layouts_hash = Slide.layouts.keys
        end

        # Only allow a trusted parameter "white list" through.
        def slide_params
          params.require(:slide).permit!
        end
    end
  end
end