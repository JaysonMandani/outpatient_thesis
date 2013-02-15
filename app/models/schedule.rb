class Schedule < ActiveRecord::Base
	attr_accessible :name, :contact_no, :schedule_for, :scheduled_on, :time

	#has_and_belongs_to_many :editors, :class_name => "AdminUser"

	# "sexy" validations
	validates :name, :presence => true, :length => {:maximum => 50}
	validates :contact_no, :presence => true, :length => {:maximum => 15}
	validates :schedule_for, :presence => true
	validates :scheduled_on, :presence => true
	validates :time, :presence => true

	def self.search(search, page)	
	paginate :per_page => 10, :page => page,
			 :conditions => ['name || lower(name) LIKE ?', "%#{search}%"],
			 :order => 'name'
	end

	# find schedule_for
	def self.scheduled_on(schedules="")
		schedules = Schedule.find_by_scheduled_on(schedules)
		if schedules
		  return schedules
		else
		  return false
		end
	end

end
