class SurveysController < ApplicationController
    include BaseHelper
    include Wicked::Wizard

    before_action :set_survey, only: [:update, :destroy]
    steps :survey_1, :survey_2, :survey_3, :survey_final
    # GET /surveys
    def index
      @surveys = Survey.all
    end

    # GET /surveys/1
    def show

    case step
      when :survey_1

        @occupations = get_occupations()
        @goals = Client.where("lower(trim(email)) = ? and lower(trim(first_name)) = ? and lower(trim(last_name)) = ?",session[:email],session[:first_name],session[:last_name]).first.goals

      when :survey_2
        outcome = ''
        (1..4).each do |count|
         if params.has_key?("Goal#{count}")
            outcome = outcome + ',' + params["Goal#{count}"].to_s
          end
        end
        #outcome = params["Goal1"].to_s + ',' + params["Goal2"].to_s + ',' + params["Goal3"].to_s + ',' + params["Goal4"].to_s
        @client = Client.where("lower(trim(email)) = ? and lower(trim(first_name)) = ? and lower(trim(last_name)) = ?",session[:email],session[:first_name],session[:last_name]).first
        if @client.present?
           @client.goals =  "{#{outcome}}"
           @client.save
        end

      when :survey_3
        barriers = ''
        (1..8).each do |count|

          if params.has_key?("barrier_#{count}")
            barriers = barriers + ',' + params["barrier_#{count}"].to_s
          end
        end
        @client = Client.where("lower(trim(email)) = ? and lower(trim(first_name)) = ? and lower(trim(last_name)) = ?",session[:email],session[:first_name],session[:last_name]).first
        if @client.present?
           @client.barriers =  "{#{barriers}}"
           @client.save
        end
        @education = Education.where(" client_id = ? ", @client.id).first
        @edu = []
         @edu[0] = 100
        if @education.present?
           @edu[0] = @education.high_grade_level
        end
        when:survey_final

        @client = Client.where("lower(trim(email)) = ? and lower(trim(first_name)) = ? and lower(trim(last_name)) = ?",session[:email],session[:first_name],session[:last_name]).first
        @education = Education.where(" client_id = ? ", @client.id).first
        if @education.present?
           @education.high_grade_level = params["barrier_1"].to_i
           @education.save
        else
          @education = Education.new
          @education.client_id = @client.id
          @education.high_grade_level = params["barrier_1"].to_i
          @education.save
        end
    end
    render_wizard
  end



    # GET /surveys/new
    def new

    end
    # GET /surveys/1/edit
    def edit


    end

    # POST /surveys
    def create
      @survey = Survey.new(survey_params)

      if @survey.save
        redirect_to @survey, notice: 'Survey was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /surveys/1
    def update
      if @survey.update(survey_params)
        redirect_to @survey, notice: 'Survey was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /surveys/1
    def destroy
      @survey.destroy
      redirect_to surveys_url, notice: 'Survey was successfully destroyed.'
    end

     def finish_wizard_path
      root_path
     end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_survey
        @survey = Survey.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def survey_params
        params[:survey]
      end
  end

