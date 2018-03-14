
  class MasterDomainsController < ApplicationController
    before_action :set_master_domain, only: [:show, :edit, :update, :destroy]

    # GET /master_domains
    def index
      @master_domains = MasterDomain.all
    end

    # GET /master_domains/1
    def show
    end

    # GET /master_domains/new
    def new
      @master_domain = MasterDomain.new

    end

    # GET /master_domains/1/edit
    def edit
    end

    # POST /master_domains
    def create
      @master_domain = MasterDomain.new(master_domain_params)

      if @master_domain.save
        redirect_to @master_domain, notice: 'Master domain was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /master_domains/1
    def update
      if @master_domain.update(master_domain_params)
        redirect_to @master_domain, notice: 'Master domain was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /master_domains/1
    def destroy
      @master_domain.destroy
      redirect_to master_domains_url, notice: 'Master domain was successfully destroyed.'
    end

    


    private
      # Use callbacks to share common setup or constraints between actions.
      def set_master_domain
        @master_domain = MasterDomain.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def master_domain_params
        params.require(:master_domain).permit!#(:description,master_domian_items_attributes: [:id,:master_domain_id,:value,:short_description,:long_description,:status])
      end

  end

