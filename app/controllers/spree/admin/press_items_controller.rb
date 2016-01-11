module Spree
  module Admin
    class PressItemsController < ResourceController

      before_action :set_press_item, only: [:show, :edit, :update, :destroy]

      def index
        @press_items = PressItem.all

      end

      def show
      end

      def new
        @press_item = PressItem.new
      end

      def edit
      end

      def create
        @press_item = PressItem.new(post_params)

        if @press_item.save
          redirect_to admin_posts_path, notice: "Post was sucessfully created."
        else
          render action: 'new'
        end
      end

      def update
        if @press_item.update(post_params)
          redirect_to admin_posts_path, notice: "Post was sucessfully updated."
        else
          render action: 'new'
        end
      end

      def destroy
        @press_item.destroy
        redirect_to admin_posts_path, notice: "Post was sucessfully destroyed."
      end

      private

      def set_press_item
        @press_item = PressItem.find(params[:id])
        # @press_item = PressItem.where(slug: params[:id]).take
        # @press_item = PressItem.find_by slug: "#{params[:id]}"
        # @press_item = PressItem.first
      end

      def post_params
        params.require(:press_item).permit!
      end

    end
  end
end