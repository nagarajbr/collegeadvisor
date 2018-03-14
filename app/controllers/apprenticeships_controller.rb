
class ApprenticeshipsController < ApplicationController
  before_action :set_apprenticeship, only: [:show, :edit, :update, :destroy]

  # GET /apprenticeships
  # GET /apprenticeships.json
  def index
    @apprenticeships = Apprenticeship.all
  end

  # GET /apprenticeships/1
  # GET /apprenticeships/1.json
  def show
       if params.key?("keyword")
      keyword = params["keyword"].present? ?  params["keyword"] : "All"
      location = params["location"].present? ?  params["location"] : "little Rock , AR"

   else
      keyword = params[:id]
      location = "little Rock , AR"
   end



    @apprenticeship_listing_array = apprenticeship_listing(keyword,location)
  end

  # GET /apprenticeships/new
  def new
   # @apprenticeship = Apprenticeship.new
  end

  # GET /apprenticeships/1/edit
  def edit
  end

  # POST /apprenticeships
  # POST /apprenticeships.json
  def create
    @apprenticeship = Apprenticeship.new(apprenticeship_params)

    respond_to do |format|
      if @apprenticeship.save
        format.html { redirect_to @apprenticeship, notice: 'Apprenticeship was successfully created.' }
        format.json { render :show, status: :created, location: @apprenticeship }
      else
        format.html { render :new }
        format.json { render json: @apprenticeship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apprenticeships/1
  # PATCH/PUT /apprenticeships/1.json
  def update
    respond_to do |format|
      if @apprenticeship.update(apprenticeship_params)
        format.html { redirect_to @apprenticeship, notice: 'Apprenticeship was successfully updated.' }
        format.json { render :show, status: :ok, location: @apprenticeship }
      else
        format.html { render :edit }
        format.json { render json: @apprenticeship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apprenticeships/1
  # DELETE /apprenticeships/1.json
  def destroy
    @apprenticeship.destroy
    respond_to do |format|
      format.html { redirect_to apprenticeships_url, notice: 'Apprenticeship was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def apprenticeship_listing (arg_keyword,arg_location)
   occupation = arg_keyword
   location = arg_location
    @apprenticeship_listings_array = []
    # apprenticeship list from Career One Stop
    cos_ws = CareerOneStopWebServices.new("a","b")
    apprenticeship_listings = cos_ws.get_apprenticeship_by_occupation(occupation,location)

    if !apprenticeship_listings.empty? && apprenticeship_listings["ErrorCode"] == 404
    else
      if !apprenticeship_listings.empty? && apprenticeship_listings.length > 0
          apprenticeship_listings["ApprenticeshipSponsorList"].each do |key,val|
          apprenticeship_listings_hash = {
                                     :title => key["Title"],
                                     :sponsor => key["Sponsor"]["Name"],
                                     :address => key["Sponsor"]["Address"].to_s + " "+ key["Sponsor"]["City"].to_s + ", "+key["Sponsor"]["State"].to_s + " - "+key["Sponsor"]["Zip"].to_s,
                                     :phone => key["Sponsor"]["Phone"]
                                      }

                @apprenticeship_listings_array.push(apprenticeship_listings_hash)
              end

      end
    end
     return  @apprenticeship_listings_array
   end
  helper_method :apprenticeship_listing



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apprenticeship
         data = CareerAdvisorWebServices.new("admin","nagashri1").get_code_for_title(params[:id])
         @key = data.present? ? data[0]["onetsoc_code"]  : '00.000.00'
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def apprenticeship_params
      params.fetch(:apprenticeship, {})
    end
end
