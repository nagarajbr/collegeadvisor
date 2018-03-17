  class MasterDomain < ActiveRecord::Base

  has_many :master_domain_items #, class_name: 'MasterDomainItem'
  accepts_nested_attributes_for :master_domain_items, :reject_if => :all_blank

  
   validates_presence_of :description


  def self.item_list (domain_id)

  	where("id in (?)", domain_id ).order ("description")

  end

end
