class Address < ApplicationRecord
	enum address_type: [:Mailing , :Residence]

	belongs_to :client

	validates_uniqueness_of :client_id,:address_type

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
