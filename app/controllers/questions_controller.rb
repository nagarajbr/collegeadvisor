class QuestionsController  <  ApplicationController
include Wicked::Wizard
before_action :capture_answers, on: [:show, :update]


  steps :question_1_10, :question_11_20, :question_21_30,:question_31_40,:question_41_50,:question_51_60 ,:questions_submit



  def show
   @quest = Question.new
  	case step
  		when :question_1_10
          #flash[:alert] = "Please Answer all the question( 1- 10) to better Asses your profile"
          @questions  = CareerAdvisorWebServices.new("","").get_short_form_ip
           
          #.get_short_form_ip
      when :question_11_20
          #flash[:alert] = "Please Answer all the question( 11- 20) to better Asses your profile"
           @questions  = CareerAdvisorWebServices.new("","").get_short_form_ip
  		when :question_21_30
          #flash[:alert] = "Please Answer all the question( 21- 30) to better Asses your profile"
          @questions  = CareerAdvisorWebServices.new("","").get_short_form_ip
  		when :question_31_40
          #flash[:alert] = "Please Answer all the question( 31- 40) to better Asses your profile"
      	 @questions  = CareerAdvisorWebServices.new("","").get_short_form_ip
  		when :question_41_50
          #flash[:alert] = "Please Answer all the question( 41- 50) to better Asses your profile"
      		 @questions  = CareerAdvisorWebServices.new("","").get_short_form_ip
  		when :question_51_60
          #flash[:alert] = "Please Answer all the question( 51- 60) to better Asses your profile"
      	 @questions  = CareerAdvisorWebServices.new("","").get_short_form_ip
    end
  	render_wizard
  end

  def capture_answers
    case step

      when :question_11_20
           answers = nil
          (1..10).each do |counter|
            answers = answers.to_s + params["#{counter}"].to_s if params["1"].present?
          end
         session["#{previous_step}"] = answers.to_s if answers.present?

         if session["#{previous_step}"].to_s.length != 10
         flash[:alert] = "Please Answer all the questions( 1- 10) for better Assessement"
         jump_to(:question_1_10)
       end

      when :question_21_30
           answers = nil
          (11..20).each do |counter|
            answers = answers.to_s + params["#{counter}"].to_s if params["11"].present?
          end
           session["#{previous_step}"] = answers.to_s if answers.present?

            if session["#{previous_step}"].to_s.length != 10
               flash[:alert] = "Please Answer all the questions( 11- 20) for better Assessement"
               jump_to(:question_11_20)
            end

      when :question_31_40
           answers = nil
          (21..30).each do |counter|
            answers = answers.to_s + params["#{counter}"].to_s if params["21"].present?
          end
          session["#{previous_step}"] = answers.to_s if answers.present?

            if session["#{previous_step}"].to_s.length != 10
               flash[:alert] = "Please Answer all the questions( 21- 30) for better Assessement"
               jump_to(:question_21_30)
            end

      when :question_41_50
           answers = nil
          (31..40).each do |counter|
            answers = answers.to_s + params["#{counter}"].to_s if params["31"].present?
          end
          session["#{previous_step}"] = answers.to_s if answers.present?

          if session["#{previous_step}"].to_s.length != 10
               flash[:alert] = "Please Answer all the questions( 31- 40) for better Assessement"
               jump_to(:question_31_40)
            end

      when :question_51_60
           answers = nil
          (41..50).each do |counter|
            answers = answers.to_s + params["#{counter}"].to_s if params["41"].present?
          end
          session["#{previous_step}"] = answers.to_s if answers.present?

         if session["#{previous_step}"].to_s.length != 10
               flash[:alert] = "Please Answer all the questions( 41- 50) for better Assessement"
               jump_to(:question_41_50)
            end

            when :questions_submit
           answers = nil
          (51..60).each do |counter|
            answers = answers.to_s + params["#{counter}"].to_s if params["51"].present?
          end
          session["#{previous_step}"] = answers.to_s if answers.present?

          if session["#{previous_step}"].to_s.length != 10
               flash[:alert] = "Please Answer all the questions( 51- 60) for better Assessement"
               jump_to(:question_51_60)
            end

    end
end
   def finish_wizard_path
    session[:answers] = ""
    wizard_steps.each do |stp|
    session[:answers] = session[:answers] + session[stp].to_s if session[stp].present?
    end
    @student_assessement = StudentAssessement.new
    @student_assessement.student_id = session[:student]
    @student_assessement.assessement_date = Date.today
    @student_assessement.assessement_answers = session[:answers]
    @student_assessement.save
    interest_profilers_path

   end

end
