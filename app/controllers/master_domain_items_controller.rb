

  class MasterDomainItemsController < ApplicationController
    before_action :set_master_domain_item, only: [:show, :edit, :update, :destroy]

    # GET /master_domain_items
    def index
      @master_domain_items = MasterDomainItem.all
    end

    # GET /master_domain_items/1
    def show
    end

    # GET /master_domain_items/new
    def new
      @master_domain_item = MasterDomainItem.new
    end

    # GET /master_domain_items/1/edit
    def edit
    end

    # POST /master_domain_items
    def create
      @master_domain_item = MasterDomainItem.new(master_domain_item_params)

      if @master_domain_item.save
        redirect_to @master_domain_item, notice: 'Master domain item was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /master_domain_items/1
    def update
      if @master_domain_item.update(master_domain_item_params)
        redirect_to @master_domain_item, notice: 'Master domain item was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /master_domain_items/1
    def destroy
      @master_domain_item.destroy
      redirect_to master_domain_items_url, notice: 'Master domain item was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_master_domain_item
        @master_domain_item = MasterDomainItem.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def master_domain_item_params
        params.require(:master_domain_item).permit(:value, :short_description, :long_description, :status, :usage)
      end
  end

