module Spree
  class StockistsController < Spree::BaseController

    def index
      @stockists = Stockist.all.group_by(&:region)

      # @stockists = {
      #   "North America" => [],
      #   "International" => []
      # }

      # stockists.each do |stockist|
      #   @stockists[stockist.region].push(stockist)
      # end
    end

  end
end