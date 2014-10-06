module Spree
  module Admin
    class FeedItemsController < ResourceController
      before_action :build_types_selects, only: [:new, :edit]

      def index
        @feed_items = FeedItem.all
      end

      def show
      end

      def new
        @feed_item = FeedItem.new

        @products = Product.all

        @posts = Post.all
      end

      def edit
      end

      def create
      end

      def update
      end

      def destroy
      end

      private

        def build_types_selects
          @types_hash = FeedItem.types.keys
        end

        def build_products_hash
          @products_hash = Products.all.keys
        end

    end
  end
end

