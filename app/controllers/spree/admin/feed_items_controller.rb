module Spree
  module Admin
    class FeedItemsController < ResourceController
      before_action :build_category_options, only: [:new, :edit]
      before_action :set_feed_item, only: [:show, :edit, :update, :destroy]

      def index

        @feed_items = FeedItem.all
      end

      def show
      end

      def new
        @feed_item = FeedItem.new

      end

      def edit
      end

      def create
        @feed_item = FeedItem.new(admin_feed_item_params)

        respond_to do |format|
          if @feed_item.save
            format.html { redirect_to admin_feed_items_path, notice: 'Home Page feed item was successfully created.' }
            format.json { render action: 'show', status: :created, location: @feed_item }
          else
            format.html { render action: 'new' }
            format.json { render json: @feed_item.errors, status: :unprocessable_entity }
          end
        end
      end

      def update
        if @feed_item.update(admin_feed_item_params)
          redirect_to admin_feed_items_path, notice: 'Feed Item was sucessfully updated.'
        else
          render :edit
        end
      end

      def update_batch
        params[:feeditem].each_with_index do |id, i|
          FeedItem.find(id).update_column(:position, i + 1)
        end
        render nothing: true
      end

      def destroy
        @feed_item.destroy
        respond_to do |format|
          format.html { redirect_to admin_feed_items_url, notice: 'Feed Item was successfully destroyed.' }
          format.json { head :no_content }
        end
      end


      private

        def set_feed_item
          @feed_item = FeedItem.find(params[:id])
        end

        def build_category_options
          @products = Product.all.order("name")
          @posts = Post.unscoped.all.order("title")
          @lookbooks = Lookbook.all.order("name")

          @category_options = FeedItem.categories.keys
        end


        def admin_feed_item_params
          params.require(:feed_item).permit!
        end


    end
  end
end

