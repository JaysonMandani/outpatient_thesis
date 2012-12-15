class Pending < ActiveRecord::Base
    attr_accessible :full_name, :patient_status, :pending_for

  	def self.search(search, page)	
	paginate :per_page => 10, :page => page,
			 :conditions => ['full_name LIKE ?', "%#{search}%"],
			 :order => 'full_name'
	end
end
