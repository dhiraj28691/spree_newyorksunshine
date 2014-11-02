module Spree
  class ReturnsExchangesController < Spree::BaseController

    def index

      @returns_exchanges = Content.where(key: "returns_exchanges").first_or_create.value
      # @returns_exchanges = returns_exchanges.value

    end

  end

end