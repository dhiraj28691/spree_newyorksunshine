module Spree
  class ArtsController < Spree::BaseController
    def index
      @artist_statement = Content.where(key: "artist_statement").first_or_create.value
      @works = Work.unscoped.all
    end
  end
end