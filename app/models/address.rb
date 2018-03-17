class Address < ApplicationRecord
	enum address_type: [:Mailing , :Residence]

	belongs_to :client

	validates_uniqueness_of :client_id,:address_type

	
end
