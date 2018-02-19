
class TrainingsController < ApplicationController
  before_action :set_training, only: [:show, :edit, :update, :destroy]

  # GET /trainings
  # GET /trainings.json
  def index
    @trainings = Training.all
  end

  # GET /trainings/1
  # GET /trainings/1.json
  def show
     if params.key?("keyword")
      keyword = params["keyword"].present? ?  params["keyword"] : "All"
      location = params["location"].present? ?  params["location"] : "little Rock , AR"

   else
      keyword = params[:id]
      location = "little Rock , AR"
   end

     @training_listing_array = training_listing(keyword,location)
  end

  # GET /trainings/new
  def new
   # @training = Training.new
  end

  # GET /trainings/1/edit
  def edit
  end

  # POST /trainings
  # POST /trainings.json
  def create
    @training = Training.new(training_params)

    respond_to do |format|
      if @training.save
        format.html { redirect_to @training, notice: 'Training was successfully created.' }
        format.json { render :show, status: :created, location: @training }
      else
        format.html { render :new }
        format.json { render json: @training.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trainings/1
  # PATCH/PUT /trainings/1.json
  def update
    respond_to do |format|
      if @training.update(training_params)
        format.html { redirect_to @training, notice: 'Training was successfully updated.' }
        format.json { render :show, status: :ok, location: @training }
      else
        format.html { render :edit }
        format.json { render json: @training.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trainings/1
  # DELETE /trainings/1.json
  def destroy
    @training.destroy
    respond_to do |format|
      format.html { redirect_to trainings_url, notice: 'Training was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def training_listing (arg_keyword,arg_location)

    occupation = arg_keyword
    location = arg_location.split(",") if arg_location.present?
    city = location[0]
    state = location[1]
    @training_listings_array = []
    # training list from Career One Stop
    cos_ws = CareerOneStopWebServices.new("a","b")
    training_listings = cos_ws.get_training_by_occupation(occupation, city +" , " + state)

  if training_listings.present?
     if !training_listings.empty? && training_listings.length > 0
               training_listings.each do |key,val|

                training_listings_hash = {
                                     :schoolName => key["SchoolName"],
                                     :address => key["Address"].to_s + " "+ key["City"].to_s + ", "+key["StateAbbr"].to_s + " - "+key["Zip"].to_s,
                                     :phone => key["Phone"],
                                     :ProgramName => key["ProgramName"],
                                     :ProgramLength => key["ProgramLength"][0]["Name"],
                                     :url => key["SchoolUrl"] }

                @training_listings_array.push(training_listings_hash)
              end
      end

  end
     return @training_listings_array
  end
  helper_method :training_listing




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_training
        data = CareerAdvisorWebServices.new("admin","nagashri1").get_code_for_title(params[:id])
        @key = data.present? ? data[0]["onetsoc_code"]  : '00.000.00'
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def training_params
      params.fetch(:training, {})
    end


end
