module Spree
  module Admin
    class WorksController < ResourceController
      before_action :set_admin_work, only: [:show, :edit, :update, :destroy]

      # GET /spree/admin/works
      def index
        @admin_works = Work.all
      end

      # GET /spree/admin/works/1
      def show
      end

      # GET /spree/admin/works/new
      def new
        @admin_work = Work.new
      end

      # GET /spree/admin/works/1/edit
      def edit
      end

      # POST /spree/admin/works
      def create
        @admin_work = Work.new(admin_work_params)

        if @admin_work.save
          redirect_to admin_art_url, notice: 'Work was successfully created.'
        else
          render :new
        end
      end

      # PATCH/PUT /spree/admin/works/1
      def update
        if @admin_work.update(admin_work_params)
          redirect_to admin_art_url, notice: 'Work was successfully updated.'
        else
          render :edit
        end
      end

      # DELETE /spree/admin/works/1
      def destroy
        @admin_work.destroy
        redirect_to admin_art_url, notice: 'Work was successfully destroyed.'
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_admin_work
          @admin_work = Work.unscoped.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def admin_work_params
          params.require(:work).permit!
        end
    end
  end
end
