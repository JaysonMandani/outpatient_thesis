class AnalyticsController < ApplicationController

	before_filter :confirm_logged_in
	before_filter :find_schedules
	before_filter :find_pendings
	
	layout 'admin'
	
	def index
		
	end
end
