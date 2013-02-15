class Inventory < ActiveRecord::Base
  self.inheritance_column = nil
  attr_accessible :brand_name, :medical_name, :type, :quantity, :price
  
  	validates :brand_name, :presence => true, :uniqueness => true, :length => {:maximum => 50}
	validates :medical_name, :length => {:maximum => 50}
	validates :quantity, :presence => true, :length => {:maximum => 11}
	validates :price, :presence => true, :length => {:maximum => 11}

	def self.search(search, page)	
	paginate :per_page => 10, :page => page,
			 :conditions => ['brand_name || lower(brand_name) LIKE ?', "%#{search}%"],
			 :order => 'brand_name'
	end

end
