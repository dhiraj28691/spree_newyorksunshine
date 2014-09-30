module Spree
  class StockistsController < Spree::BaseController
    def index
      @stockists = Stockist.all.group_by(&:region)
    end
  end
end