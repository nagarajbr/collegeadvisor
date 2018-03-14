
  class AgencyProvidersController < ApplicationController
    before_action :set_agency_provider, only: [:show, :edit, :update, :destroy]

    # GET /agency_providers
    def index
      @agency_providers = AgencyProvider.all
    end

    # GET /agency_providers/1
    def show
       @gency_providers = get_results_from_sql(@key)
    end

    # GET /agency_providers/new
    def new
      @agency_provider = AgencyProvider.new
    end

    # GET /agency_providers/1/edit
    def edit
    end

    # POST /agency_providers
    def create
      @agency_provider = AgencyProvider.new(agency_provider_params)

      if @agency_provider.save
        redirect_to @agency_provider, notice: 'Agency provider was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /agency_providers/1
    def update
      if @agency_provider.update(agency_provider_params)
        redirect_to @agency_provider, notice: 'Agency provider was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /agency_providers/1
    def destroy
      @agency_provider.destroy
      redirect_to agency_providers_url, notice: 'Agency provider was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_agency_provider
         data = CareerAdvisorWebServices.new("admin","nagashri1").get_code_for_title(params[:id])
         @key = data.present? ? data[0]["onetsoc_code"]  : '00.000.00'

      end

      # Only allow a trusted parameter "white list" through.
      def agency_provider_params
        params[:agency_provider]
      end

      def get_results_from_sql(arg_code)
      agency_provider = []
      uri = URI.parse(Caddy.url)
       if Caddy.sql_statement.present?
          sql = Caddy.sql_statement
          sql = sql.gsub '{value}', "#{arg_code}" if sql.present?
          postgres = PG.connect(uri.hostname, uri.port, nil, nil, uri.path[1..-1], uri.user, uri.password)
          records = postgres.exec(sql) if sql.present?
           records.num_tuples.times do |i|
            agency_provider << records[i]
           end
        end
      postgres.close

      return agency_provider
    end

    helper_method :get_results_from_sql
  end

