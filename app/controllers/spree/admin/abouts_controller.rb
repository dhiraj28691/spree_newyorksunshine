module Spree
  module Admin
    class AboutsController < Spree::Admin::BaseController

      before_action :set_about, only: [:show, :edit, :update, :destroy]

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

        if @about.update(returns_exchanges_params)
          redirect_to admin_contents_path, notice: 'Returns & Exchanges was successfully updated.'
        else
          render :edit
        end

      end

      def destroy
      end

      private

      def set_about
        @about = Content.where(key: "about").first_or_create
      end

      def returns_exchanges_params
          params.require(:about).permit(:value)
      end

    end
  end
end