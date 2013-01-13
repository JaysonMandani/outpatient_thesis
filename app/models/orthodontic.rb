class Orthodontic < ActiveRecord::Base
  	attr_accessible :full_name, :address, :age, :occupation, :mobile_no, :resident_no, :status, :birth_date, :sex, :reffered_by, :birthplace, :examination_date, :examination_result
  
  	#has_and_belongs_to_many :editors, :class_name => "AdminUser"

  	# "sexy" validations
  	validates :full_name, :presence => true, :length => {:maximum => 50}
  	validates :address, :presence => true, :length => {:maximum => 80}
  	validates :age, :presence => true
  	validates :mobile_no, :presence => true, :length => {:maximum => 15}
  
	def self.search(search, page)	
		paginate :per_page => 10, :page => page,
				 :conditions => ['full_name LIKE ?', "%#{search}%"],
				 :order => 'full_name'
	end

end
