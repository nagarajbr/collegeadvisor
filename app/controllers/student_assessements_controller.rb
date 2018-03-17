class StudentAssessementsController < ApplicationController
	def index
	  if session[:student].present?
       @student_assessements = StudentAssessement.where("student_id = ?" , session[:student])
     end
  end

  def show
  	@student_assessement = StudentAssessement.where("id = ?",params[:id])
  	if @student_assessement.present? 
	  	session[:answers] = @student_assessement.first.assessement_answers
	    redirect_to interest_profilers_path
	end
  	
  end

end
