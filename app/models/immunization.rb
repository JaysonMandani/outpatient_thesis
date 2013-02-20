class Immunization < ActiveRecord::Base
  attr_accessible :pediatric_id, :vaccination_name, :vaccination_session, :booster_session, :vaccination_type

	# "sexy" validations
 	validates :vaccination_type, :length => {:maximum => 50}

end
