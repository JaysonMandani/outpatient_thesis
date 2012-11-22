class Inventory < ActiveRecord::Base

  attr_accessible :brand_name, :medical_name, :medical_type, :quantity, :price
  
  #has_may :bills
  #has_and_belongs_to_many :editors, :class_name => "AdminUser"
  
  	validates :brand_name, :presence => true, :length => {:maximum => 50}
	validates :medical_name, :presence => true, :length => {:maximum => 50}
	validates :medical_type, :presence => true, :length => {:maximum => 50}
	validates :quantity, :presence => true, :length => {:maximum => 11}
	validates :price, :presence => true, :length => {:maximum => 11}

	def self.search(search, page)	
	paginate :per_page => 10, :page => page,
			 :conditions => ['brand_name LIKE ?', "%#{search}%"],
			 :order => 'brand_name'
	end

end
