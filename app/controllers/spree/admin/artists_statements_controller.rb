module Spree
  module Admin
    class ArtistsStatementsController < Spree::Admin::BaseController

      before_action :set_artists_statement, only: [:edit, :show, :update, :destroy]

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

        if @artists_statement.update(artists_statement_params)
          redirect_to admin_art_url, notice: 'Artist\'s Statement was successfully updated.'
        else
          render :edit
        end

      end

      def destroy
      end

      private

      def set_artists_statement
        @artists_statement = Content.where(key: "artist_statement").first_or_create
      end

      def artists_statement_params
          params.require(:artists_statement).permit(:value)
      end

    end
  end
end