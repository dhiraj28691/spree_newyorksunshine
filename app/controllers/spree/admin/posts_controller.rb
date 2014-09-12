module Spree
  module Admin
    class PostsController < ResourceController

      before_action :set_post, only: [:show, :edit, :update, :destroy]

      def index
        @posts = Post.all
      end

      def show
      end

      def new
        @post = Post.new
      end

      def edit
      end

      def create
        @post = Post.new(post_params)

        if @post.save
          redirect_to admin_posts_path, notice: "Post was sucessfully created."
        else
          render action: 'new'
        end
      end

      def update
        if @post.update(post_params)
          redirect_to admin_posts_path, notice: "Post was sucessfully updated."
        else
          render action: 'new'
        end
      end

      def destroy
        @post.destroy
        redirect_to admin_posts_path, notice: "Post was sucessfully destroyed."
      end

      private

      def set_post
        @post = Post.find(params[:id])
        # @post = Post.where(slug: params[:id]).take
        # @post = Post.find_by slug: "#{params[:id]}"
        # @post = Post.first
      end

      def post_params
        params.require(:post).permit!
      end

    end
  end
end