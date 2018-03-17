
  class MasterDomainItem < ActiveRecord::Base
   #attr_accessor :master_domain_id,:value, :short_description, :long_description, :status, :usage ,:created_by,:updated_by
   belongs_to :master_domain #, class_name: 'MasterDomain'

 def self.item_list(master_domain_id)

  	where("master_domain_id = ?", master_domain_id ).order ("short_description")

  end
end
