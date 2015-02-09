module Spree
  module Admin
    class ArtsController < Spree::Admin::BaseController

      before_action :set_artists_statement, only: [:show, :edit, :update, :destroy]

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
          redirect_to admin_contents_path, notice: 'Artists Statement was successfully updated.'
        else
          render :edit
        end

      end

      def destroy
      end

      private

      def set_artists_statement
        @artist_statement = Content.where(key: "artist_statement").first_or_create.value
      end

      def returns_exchanges_params
          params.require(:art).permit(:value)
      end

    end
  end
end