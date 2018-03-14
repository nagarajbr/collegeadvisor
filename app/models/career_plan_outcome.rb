class CareerPlanOutcome < ApplicationRecord
	enum activity: { job_search: 0 , community_service: 1, apprenticeship: 2, job_skills_training:3, work_experience: 4, education_training: 5  }
    enum completed: { completed: 0 , partial_completed: 1, not_completed: 2  }
	#has_many :WorkSearchBlog
	include AuditModule
   before_create :set_create_user_fields
   before_update :set_update_user_field


    def set_create_user_fields
        user_id = AuditModule.get_current_user.id

        self.created_by = user_id
        self.updated_by = user_id
        self.job_seeker_id = user_id
    end

    def set_update_user_field
        user_id = AuditModule.get_current_user.id
        self.updated_by = user_id
    end

end

