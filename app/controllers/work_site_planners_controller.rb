
class WorkSitePlannersController < ApplicationController
  before_action :set_work_site_planner, only: [:show, :edit, :update, :destroy]
  include BaseHelper
  # GET /work_site_planners
  # GET /work_site_planners.json
  def index
      if CareerPlanOutcome.where("activity = 4 ").present?
    else
      @activity = CareerPlanOutcome.new
      @activity.activity = 4 # Job Search
      @activity.job_seeker_id = current_client.id
      @activity.start_date = Date.today
      @activity.completed = 2
      @activity.save
    end
    @work_site_planners = WorkSitePlanner.all
  end

  # GET /work_site_planners/1
  # GET /work_site_planners/1.json
  def show
  end

  # GET /work_site_planners/new
  def new
    @occupations = get_occupations()
    @activity = CareerPlanOutcome.where("activity = 4 ").first

    if @activity.present?

    @work_site_planner = WorkSitePlanner.new
  end
  end

  # GET /work_site_planners/1/edit
  def edit
   # @occupations = get_occupations()
  end

  # POST /work_site_planners
  # POST /work_site_planners.json
  def create
     @activity = CareerPlanOutcome.where("activity = 4 ").first

    @work_site_planner = WorkSitePlanner.new(work_site_planner_params)
    @work_site_planner.career_plan_outcome_id = @activity.id
    @work_site_planner.job_seeker_id = current_client.id
     @event = Event.new
     @event.title = @activity.activity
     @event.start = Date.today
     @event.end = Date.today
     @event.resource_id = 1
     @event.job_seeker_id = current_client.id
     @event.save
    respond_to do |format|
      if @work_site_planner.save
        format.html { redirect_to @work_site_planner, notice: 'Work Experience Activity was successfully created.' }
        format.json { render :show, status: :created, location: @work_site_planner }
      else
        format.html { render :new }
        format.json { render json: @work_site_planner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /work_site_planners/1
  # PATCH/PUT /work_site_planners/1.json
  def update
    respond_to do |format|
      if @work_site_planner.update(work_site_planner_params)
        format.html { redirect_to @work_site_planner, notice: 'Work Experience Activity was successfully updated.' }
        format.json { render :show, status: :ok, location: @work_site_planner }
      else
        format.html { render :edit }
        format.json { render json: @work_site_planner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_site_planners/1
  # DELETE /work_site_planners/1.json
  def destroy
    @work_site_planner.destroy
    respond_to do |format|
      format.html { redirect_to career_plan_outcomes_path, notice: 'Work Experience Activity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_site_planner
      #@work_site_planner = WorkSitePlanner.find(params[:id])

       @event = Event.find(params[:id]) 
       @event.date_range = @event.start.to_date.to_s + " To "+ (@event.end.to_date - 1.day).to_s 

       Rails.logger.debug("-------#{@event.inspect}")
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def work_site_planner_params
      params.require(:work_site_planner).permit(:career_plan_outcomes_id, :work_site_name, :point_of_contact, :occupation, :position_type, :salary_per_hour, :working_hours_per_week, :completed, :outcome,:activity_date)
    end
end
