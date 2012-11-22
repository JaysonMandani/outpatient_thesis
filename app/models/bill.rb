class Bill < ActiveRecord::Base
  # attr_accessible :title, :body

  belongs_to :inventories

  	def self.search(search, page)	
		paginate :per_page => 10, :page => page,
			     :conditions => ['brand_name LIKE ?', "%#{search}%"],
			     :order => 'brand_name'
	end

end
