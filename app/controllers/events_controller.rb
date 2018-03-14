class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.where(start: params[:start]..params[:end])
  end

  def show
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    
    days = Hash.new
    @event = Event.new(event_params)
    start_date = params["event"]["date_range"].split("-").first.strip
    end_date = params["event"]["date_range"].split("-").last.strip
    @event.start = Date.strptime(start_date, '%m/%d/%Y')
    @event.end =  Date.strptime(end_date, '%m/%d/%Y')
    @event.job_seeker_id = current_client.id


 
    (@event.start.to_date  .. @event.end.to_date).each do |date|
      days["#{date.strftime("%B, %Y").to_s}"]   =  'No' unless days.has_key?("#{date.strftime("%B, %Y").to_s}")
    end

    @event.month_to_complete = days
    
  @event.save


  end

  def update
    data = params["event"]["month_completed"]

    if  @event.month_to_complete.has_key?("#{data}")
      @event.month_to_complete["#{data}"] = 'Yes' 
      @event.save
    end 
    redirect_to career_plan_outcomes_path
  end

  def destroy
    @event.destroy
    redirect_to career_plan_outcomes_path
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :date_range, :start, :end, :color,:resource_id,:job_seeker_id,:name,:contact,:hours,:outcome,:occupation_program,:position_major,:month_to_complete)
    end
end
