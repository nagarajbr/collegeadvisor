class Education < ApplicationRecord
  enum attendance_type: ['Full Time', 'Half Time And More','Less Than Half Time']
  enum major_study: ['GED', 'License', 'HS Diploma','AA Degree',"Bachelor's Degree","Master's Degree",'Certificate','PhD']
  enum high_grade_level: ['01','02','03','04','05','06','07','08','09','10','11','12',"2 Year College or TECH ","College Graduate","Masters Degree"]
belongs_to :client
has_many :education_details, dependent: :destroy

accepts_nested_attributes_for :education_details,
                              allow_destroy: true, 
                              :reject_if => :all_blank

	before_create :set_create_user_fields
  before_update :set_update_user_field

	  
    def set_create_user_fields
      user_id = 1
      self.created_by = user_id
      self.updated_by = user_id
    end

    def set_update_user_field
      user_id = 1
      self.updated_by = user_id
    end
end
