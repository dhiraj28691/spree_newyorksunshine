module Spree
  module Admin
    class PostImagesController < ResourceController
      before_action :set_post
      before_action :set_image, only: [:show, :edit, :update, :destroy]

      def index
        @post_images = @post.post_images
      end

      def show
      end

      def new
        @post_image = @post.post_images.build
      end

      def edit
      end

      def create
        @image = @post.post_images.build(post_image_params)

        respond_to do |format|
          if @image.save
            format.html { redirect_to admin_post_post_images_path, notice: 'Image was successfully created.' }
            format.json { render action: 'show', status: :created, location: @post_image }
          else
            format.html { render action: 'new' }
            format.json { render json: @post_image.errors, status: :unprocessable_entity }
          end
        end
      end

      def update
        respond_to do |format|
          if @image.update(post_image_params)
            format.html { redirect_to admin_post_post_images_path, notice: 'Image was successfully updated.' }
            format.json { head :no_content }
          else
            format.html { render action: 'edit' }
            format.json { render json: @image.errors, status: :unprocessable_entity }
          end
        end
      end

      private

      def set_post
        @post = Post.find(params[:post_id])
      end

      def set_image
        @image = @post.post_images.find(params[:id])
      end

      def post_image_params
        params.require(:post_image).permit!
      end

    end
  end
end