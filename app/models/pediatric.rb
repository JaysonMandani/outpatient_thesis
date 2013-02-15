class Pediatric < ActiveRecord::Base
  
  	attr_accessible :id, :full_name, :address, :contact_no, :age, :birth_date, :sex, :mother_name, :father_name, :f_age, :m_age, :f_occupation, :m_occupation, :type_of_feeding, :supplementary, :examination_date, :history_phtysical_exams, :physicians_instructions, :name_of_vaccination, :vaccination, :booster, :type_of_vaccination, :term, :head, :delivery, :chest_circ, :food, :birth_weight, :abdominal, :medicine, :birth_length, :obsterician, :head_circ, :others, :weight, :height, :history_physical_exams
  
  	#has_many :immunizations
  	#has_and_belongs_to_many :editors, :class_name => "AdminUser"
 
  	# "sexy" validations
  	validates :full_name, :presence => true, :length => {:maximum => 50}, :uniqueness => {:case_sensitive => false}
  	validates :address, :presence => true, :length => {:maximum => 80}
  	validates :contact_no, :presence => true, :length => {:maximum => 15}

	def self.search(search, page)
    name = "full_name"	
		paginate :per_page => 10 , :page => page,
				 :conditions => [ "full_name || lower(full_name) LIKE ?", "%#{search}%" ],
				 :order => name
	end
  
 	#scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"])}

  def self.total_on(date)
    where("date(created_at) = ?", date).count(:full_name)
  end
end
