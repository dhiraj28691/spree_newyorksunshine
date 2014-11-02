module Spree
  module Admin
    class ContentsController < ResourceController
      before_action :set_content, only: [:show, :edit, :update, :destroy]

      # GET /spree/admin/contents
      def index
        @contents = Content.all
      end

      # GET /spree/admin/contents/1
      def show
      end

      # GET /spree/admin/contents/new
      def new
        @content = Content.new
      end

      # GET /spree/admin/contents/1/edit
      def edit
      end

      # POST /spree/admin/contents
      def create
        @content = Content.new(content_params)

        if @content.save
          redirect_to admin_contents_path, notice: 'Content was successfully created.'
        else
          render :new
        end
      end

      # PATCH/PUT /spree/admin/contents/1
      def update
        if @content.update(content_params)
          redirect_to admin_contents_path, notice: 'Content was successfully updated.'
        else
          render :edit
        end
      end

      # DELETE /spree/admin/contents/1
      def destroy
        @content.destroy
        redirect_to admin_contents_path, notice: 'Content was successfully destroyed.'
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_content
          @content = Content.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def content_params
          params.require(:content).permit(:key, :value)
        end
    end
  end
end
