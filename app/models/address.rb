class Address < ApplicationRecord
	enum address_type: [:Mailing , :Residence]

	validates_uniqueness_of :client_id,:address_type
end
