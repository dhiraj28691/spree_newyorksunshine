module Spree
  module Admin
    class ArtsController < Spree::Admin::BaseController

      def show
        @artist_statement = Content.where(key: "artist_statement").first_or_create.value
        @admin_works = Work.unscoped.order('position')
      end

    end
  end
end