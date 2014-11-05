module Spree
  class NewsController < Spree::BaseController

    def index

      if params[:tag]
        @posts = Spree::Post.tagged_with(params[:tag])
      else
        @posts = Spree::Post.all
      end

    end

    def show

      @post = Spree::Post.find(params[:id])

    end

  end
end

