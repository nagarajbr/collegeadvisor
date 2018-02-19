
class WorkSearchBlogsController < ApplicationController
  before_action :set_work_search_blog, only: [:show, :edit, :update, :destroy]

  # GET /work_search_blogs
  # GET /work_search_blogs.json
  def index
    #Check if Job Serrch Activity present,if not insert one

    if CareerPlanOutcome.where("activity = 0 ").present?
    else
      @activity = CareerPlanOutcome.new
      @activity.activity = 0 # Job Search
      @activity.job_seeker_id = current_client.id
      @activity.start_date = Date.today
      @activity.completed = 2
      @activity.save
    end
    @work_search_blogs = WorkSearchBlog.all
  end

  # GET /work_search_blogs/1
  # GET /work_search_blogs/1.json
  def show
  end

  # GET /work_search_blogs/new
  def new

     @activity = CareerPlanOutcome.where("activity = 0 ").first

    if @activity.present?

    @work_search_blog = WorkSearchBlog.new
  end


    #@work_search_blog = WorkSearchBlog.new
  end

  # GET /work_search_blogs/1/edit
  def edit
  end

  # POST /work_search_blogs
  # POST /work_search_blogs.json
  def create
    @activity = CareerPlanOutcome.where("activity = 0 ").first

    @work_search_blog = WorkSearchBlog.new(work_search_blog_params)
    @work_search_blog.career_plan_outcome_id = @activity.id
    @work_search_blog.job_seeker_id = current_client.id
     @event = Event.new
     @event.title = @activity.activity
     @event.start = Date.today
     @event.end = Date.today
     @event.resource_id = 1
     @event.job_seeker_id = current_client.id
     @event.save
    respond_to do |format|
      if @work_search_blog.save
        format.html { redirect_to @work_search_blog, notice: 'Work search blog was successfully created.' }
        format.json { render :show, status: :created, location: @work_search_blog }
      else
        format.html { render :new }
        format.json { render json: @work_search_blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /work_search_blogs/1
  # PATCH/PUT /work_search_blogs/1.json
  def update
    fail
    respond_to do |format|
      if @work_search_blog.update(work_search_blog_params)
        format.html { redirect_to @work_search_blog, notice: 'Work search blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @work_search_blog }
      else
        format.html { render :edit }
        format.json { render json: @work_search_blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_search_blogs/1
  # DELETE /work_search_blogs/1.json
  def destroy
    @work_search_blog.destroy
    respond_to do |format|
      format.html { redirect_to work_search_blogs_url, notice: 'Work search blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_search_blog
      @event = Event.find(params[:id]) 
      @event.date_range = @event.start.to_date.to_s + " To "+ (@event.end.to_date - 1.day).to_s 
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def work_search_blog_params
      params.require(:work_search_blog).permit(:activity_date, :hours_spent, :work_site_name, :address1, :address2, :city, :state, :zip, :person_contacted, :contact_outcome, :comments, :job_seeker_id)
    end
end
