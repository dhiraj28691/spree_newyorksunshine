module Spree
  class PressController < Spree::BaseController

    def index
      @press = Content.where(key: "press").first_or_create.value
    end

  end

end
