class EducationPlannersController < ApplicationController
  before_action :set_education_planner, only: [:show, :edit, :update, :destroy]

  # GET /education_planners
  # GET /education_planners.json
  def index
     if CareerPlanOutcome.where("activity = 5 ").present?
    else
      @activity = CareerPlanOutcome.new
      @activity.activity = 5 # Job Search
      @activity.job_seeker_id = current_client.id
      @activity.start_date = Date.today
      @activity.completed = 2
      @activity.save
    end
    @education_planners = EducationPlanner.all
  end

  # GET /education_planners/1
  # GET /education_planners/1.json
  def show
  end

  # GET /education_planners/new
  def new
    @activity = CareerPlanOutcome.where("activity = 5 ").first

    if @activity.present?

    @education_planner =  EducationPlanner.new
  end
    #@education_planner = EducationPlanner.new
  end

  # GET /education_planners/1/edit
  def edit
  end

  # POST /education_planners
  # POST /education_planners.json
  def create
    @activity = CareerPlanOutcome.where("activity = 5 ").first
    @education_planner =  EducationPlanner.new(education_planner_params)
    @education_planner.career_plan_outcome_id = @activity.id
    @education_planner.job_seeker_id = current_client.id
     @event = Event.new
     @event.title = @activity.activity
     @event.start = Date.today
     @event.end = Date.today
     @event.resource_id = 1
     @event.job_seeker_id = current_client.id
     @event.save
    respond_to do |format|
      if @education_planner.save
        format.html { redirect_to @education_planner, notice: 'Career & Technical Education Activities was successfully created.' }
        format.json { render :show, status: :created, location: @education_planner }
      else
        format.html { render :new }
        format.json { render json: @education_planner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /education_planners/1
  # PATCH/PUT /education_planners/1.json
  def update
    respond_to do |format|
      if @education_planner.update(education_planner_params)
        format.html { redirect_to @education_planner, notice: 'Career & Technical Education Activities was successfully updated.' }
        format.json { render :show, status: :ok, location: @education_planner }
      else
        format.html { render :edit }
        format.json { render json: @education_planner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /education_planners/1
  # DELETE /education_planners/1.json
  def destroy
    @education_planner.destroy
    respond_to do |format|
      format.html { redirect_to career_plan_outcomes_path, notice: 'Career & Technical Education Activities was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_education_planner
       @event = Event.find(params[:id]) 
      #@event.date_range = @event.start.to_date.to_s + " To "+ (@event.end.to_date - 1.day).to_s 
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def education_planner_params
      params.require(:education_planner).permit(:activity, :school_name, :point_of_contact, :program, :major, :class_hours_per_week, :completed, :outcome,:activity_date)
    end
end
