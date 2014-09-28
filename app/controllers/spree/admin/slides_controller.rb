module Spree
  module Admin
    class SlidesController < ResourceController
      before_action :set_lookbook, only: [:index, :new, :create]
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
        @action = [:admin, @lookbook, @slide]
      end

      # GET /spree/admin/slides/1/edit
      def edit
        @lookbook = @slide.lookbook
        @action = [:admin, @slide]
      end

      # POST /spree/admin/slides
      def create
        @slide = @lookbook.slides.build(slide_params)

        @action = [:admin, @lookbook, @slide]

        if @slide.save
          redirect_to admin_slide_path(@slide), notice: 'Slide was successfully created.'
        else
          render :new
        end
      end

      # PATCH/PUT /spree/admin/slides/1
      def update
        if @slide.update(slide_params)
          redirect_to admin_slide_path(@slide), notice: 'Slide was successfully updated.'
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