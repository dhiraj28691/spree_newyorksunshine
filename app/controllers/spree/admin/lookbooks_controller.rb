module Spree
  module Admin
    class LookbooksController < ResourceController

      before_action :set_lookbook, only: [:show, :edit, :update, :destroy]

      def index
        @lookbooks = Lookbook.all
      end

      def show

      end

      def new
        @lookbook = Lookbook.new

      end

      def edit
      end

      def create
        @lookbook = Lookbook.new(lookbook_params)

        respond_to do |format|
          if @lookbook.save
            format.html { redirect_to admin_lookbooks_path, notice: 'Lookbook was successfully created.' }
            format.json { render action: 'show', status: :created, location: @lookbook }
          else
            format.html { render action: 'new' }
            format.json { render json: @lookbook.errors, status: :unprocessable_entity }
          end
        end
      end

      def update
        respond_to do |format|
          if @lookbook.update(lookbook_params)
            format.html { redirect_to admin_lookbooks_path, notice: 'Lookbook was successfully created.' }
            format.json { render action: 'show', status: :created, location: @lookbook }
          else
            format.html { render action: 'new' }
            format.json { render json: @lookbook.errors, status: :unprocessable_entity }
          end
        end
      end

      def destroy
      end

      private

      def set_lookbook
        @lookbook = Spree::Lookbook.friendly.find(params[:id])
      # @lookbook = Spree::Lookbook.find(params[:id])
      end

      def lookbook_params
        params.require(:lookbook).permit!
      end

    end
  end
end