
class InterestProfilersController < ApplicationController
  before_action :set_interest_profiler, only: [:edit, :update, :destroy]


  # GET /interest_profilers
  # GET /interest_profilers.json
  def index


     @occupation_details_array = []
     occupation_title_code_array = []
     onet_ws = OnetWebService.new("arwins","9436zfu")
     cos_ws = CareerOneStopWebServices.new("a","b")
      indeed_ws = IndeedWebService.new()
      usjob_ws = UsJobsWebService.new()
     #@occupations = onet_ws.get_interest_profiler_matching_carrers(session[:answers].to_i)
     @occupations = CareerAdvisorWebServices.new("admin","nagashri1").get_short_form_ip_results(session[:answers].to_i)


     @occupations.each do |key,val|
        indeed_job_count = indeed_ws.job_by_location_count(key["title"],'little Rock' , 'AR')
        us_job_count = 0# usjob_ws.job_by_location_count(key["title"],'little Rock' , 'AR')
        apprenticeship_count =   cos_ws.get_apprenticeship_count_by_occupation(key["onetsoc_code"],'Little Rock , AR')
        training_count =  cos_ws.get_training_count_by_occupation(key["onetsoc_code"],'Little Rock , AR')
        #agency_providers_count = get_results_count_from_sql(key["onetsoc_code"])
        if indeed_job_count.to_i < 0
           job_count = 0  
        else
          job_count = indeed_job_count.to_i
        end 
          
        if (job_count == 0 && apprenticeship_count == 0 && training_count == 0 )
        else
            occupation_details_hash = { :code => key["onetsoc_code"],:title => key["title"], :fit => key["fit"] ,:jobcount => job_count , :apprenticecount => apprenticeship_count , :trainingcount => training_count }
            occupation_title_code_hash = {:title => key["title"],:code => key["onetsoc_code"]}
            @occupation_details_array.push(occupation_details_hash)
            occupation_title_code_array.push(occupation_title_code_hash)
       end
     end

       
     #@occupation_details_array =  Kaminari.paginate_array(@occupation_details_array, total_count: @occupations.count).page(params[:page]).per(10)
     #session[:occp_code] = occupation_title_code_array
  end

  # GET /interest_profilers/1
  # GET /interest_profilers/1.json
  def show
    @questions  = CareerAdvisorWebServices.new("","").get_short_form_ip
  # @questions  = OnetWebService.new("arwins","9436zfu").get_interest_profiler_questions_60(1,60)
  end

  # GET /interest_profilers/new
  def new
    #@interest_profiler = InterestProfiler.new
  end

  # GET /interest_profilers/1/edit
  def edit

    @career_details= OnetWebService.new("arwins","9436zfu").get_interest_profiler_full_career_report(@occupation_code)

  end

  # POST /interest_profilers
  # POST /interest_profilers.json
  def create
    #Check if all questions were ANSWERED
    answers = nil
    (1..60).each do |i|
    answers = answers.to_s + params["#{i}"].to_s if params.key?("#{i}")
    end
   if  answers.present? && answers.length == 60
    session[:answers] = answers
    redirect_to interest_profilers_path
   else
   flash[:notice] = 'Please answer all the question to proceed further'
   redirect_to interest_profiler_path(1)
   end

   end

  # PATCH/PUT /interest_profilers/1
  # PATCH/PUT /interest_profilers/1.json
  def update
    respond_to do |format|
      if @interest_profiler.update(interest_profiler_params)
        format.html { redirect_to @interest_profiler, notice: 'Interest profiler was successfully updated.' }
        format.json { render :show, status: :ok, location: @interest_profiler }
      else
        format.html { render :edit }
        format.json { render json: @interest_profiler.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interest_profilers/1
  # DELETE /interest_profilers/1.json
  def destroy
    @interest_profiler.destroy
    respond_to do |format|
      format.html { redirect_to interest_profilers_url, notice: 'Interest profiler was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interest_profiler
        @occupation_code = CareerAdvisorWebServices.new("admin","nagashri1").get_code_for_title(params[:id])[0]["onetsoc_code"]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def interest_profiler_params
      params.fetch(:interest_profiler, {})
    end




end
