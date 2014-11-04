module Spree
  class AboutController < Spree::BaseController

    def index
      @about = Content.where(key: "about").first_or_create.value
    end

  end

end