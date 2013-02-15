class Pending < ActiveRecord::Base
    attr_accessible :full_name, :patient_status, :pending_for

    validates :full_name, :presence => true, :length => {:maximum => 50}
    
  	def self.search(search, page)	
	paginate :per_page => 10, :page => page,
			 :conditions => ['full_name || lower(full_name) LIKE ?', "%#{search}%"],
			 :order => 'full_name'
	end

	# find pendings
	def self.pending_on
		Pending.where(:created_at => (Date.today))
	end
end
