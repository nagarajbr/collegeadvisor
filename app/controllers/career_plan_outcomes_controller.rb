
class CareerPlanOutcomesController < ApplicationController
  before_action :set_career_plan_outcome, only: [:show, :edit, :update, :destroy]
  include BaseHelper
  # GET /career_plan_outcomes
  # GET /career_plan_outcomes.json
  def index
    #@career_plan_outcomes = CareerPlanOutcome.all
    @work_search_blogs = Event.where("title = 'Job Search'")
    @education_planners =  Event.where("title = 'Career & Technical Training'")
    @work_site_planners = Event.where("title = 'Work Experience'")
    @occupations = get_occupations()
  end

  # GET /career_plan_outcomes/1
  # GET /career_plan_outcomes/1.json
  def show
    fail
  end

  # GET /career_plan_outcomes/new
  def new
    @career_plan_outcome = CareerPlanOutcome.new
  end

  # GET /career_plan_outcomes/1/edit
  def edit
  end

  # POST /career_plan_outcomes
  # POST /career_plan_outcomes.json
  def create
    # @career_plan_outcome = CareerPlanOutcome.where("job_seeker_id = ? and activity = 0 ",current_user.id).first
    # if @career_plan_outcome.present?
    # else
    # @career_plan_outcome = CareerPlanOutcome.new
    # @career_plan_outcome.job_seeker_id = current_user.id
    # @career_plan_outcome.activity = 0 #"Job Search"
    # @career_plan_outcome.start_date = Date.today
    # @career_plan_outcome.save
    # end

    # @work_blog = @career_plan_outcome.caddy_work_search_blogs.new
    # #@work_blog.career_plan_outcomes_id = @career_plan_outcome.id
    # @work_blog.activity_date = Date.today
    # @work_blog.work_site_name = params["jobtitle"]
    # @work_blog.job_seeker_id = current_client.id
    # @work_blog.save
    # redirect_to params["url"]
  end

  # PATCH/PUT /career_plan_outcomes/1
  # PATCH/PUT /career_plan_outcomes/1.json
  def update
    fail
    respond_to do |format|
      if @career_plan_outcome.update(career_plan_outcome_params)
        format.html { redirect_to @career_plan_outcome, notice: 'Career plan outcome was successfully updated.' }
        format.json { render :show, status: :ok, location: @career_plan_outcome }
      else
        format.html { render :edit }
        format.json { render json: @career_plan_outcome.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /career_plan_outcomes/1
  # DELETE /career_plan_outcomes/1.json
  def destroy
    @career_plan_outcome.destroy
    respond_to do |format|
      format.html { redirect_to career_plan_outcomes_url, notice: 'Career plan outcome was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_outcome
    fail
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_career_plan_outcome
      @career_plan_outcome = CareerPlanOutcome.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def career_plan_outcome_params
      params.require(:career_plan_outcome).permit(:job_seeker_id, :activity, :start_date, :end_date, :outcome,:completed,:planned_hours,:reason)
    end
end
