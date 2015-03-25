module Spree
  class LookbooksController < Spree::BaseController
    before_action :set_lookbooks

    def index
      redirect_to lookbook_path(@lookbooks.first)
    end


    def show
      @lookbook = Lookbook.friendly.find(params[:id])

      @image_stretcher_path = "//newyorksunshine-production.s3.amazonaws.com/placeholders/#{@lookbook.aspect_ratio}.png"
    end

    private

    def set_lookbooks
      @lookbooks = Lookbook.published.all
    end

  end

end