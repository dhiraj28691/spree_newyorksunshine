module Spree
  module Admin
    class ReturnsExchangesController < Spree::Admin::BaseController

      before_action :set_returns_exchanges, only: [:show, :edit, :update, :destroy]

      def create
      end

      def new
      end

      def edit
      end

      def show
        puts 'this is a test'
      end

      def update

        if @returns_exchanges.update(returns_exchanges_params)
          redirect_to admin_contents_path, notice: 'Returns & Exchanges was successfully updated.'
        else
          render :edit
        end

      end

      def destroy
      end

      private

      def set_returns_exchanges
        @returns_exchanges = Content.where(key: "returns_exchanges").first_or_create
      end

      def returns_exchanges_params
          params.require(:returns_exchanges).permit(:value)
      end

    end
  end
end