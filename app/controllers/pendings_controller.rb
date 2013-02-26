class PendingsController < ApplicationController

	layout 'admin'

	before_filter :confirm_logged_in
	before_filter :find_schedules
	before_filter :find_pendings
	before_filter :load

	def load
		@pendings = Pending.search(params[:search], params[:page])
		@pending = Pending.new
	end

	def index
		# @pendings = Pending.find(:all)
		# @date = params[:month] ? Date.parse(params[:month]) : Date.today
	end

	def show
		pending = Date.today
		@pendings = Pending.scheduled_on(pending)
		# if @pendings
		# flash[:notification] = 'Notification'
		# return true
		# else
		# return false
		# end
	end

	def create
		@pending = Pending.new(params[:pending])
		if @pending.save
			flash[:success] = 'Pending has been crated.'
		  @pendings = Pending.search(params[:search], params[:page])
		end
	end

	def edit
		@pending = Pending.find(params[:id])
	end

	def update
		@pending = Pending.find(params[:id])
		if @pending.update_attributes(params[:pending])
			flash[:success] = 'Pending has been updated.'
			@pendings = Pending.search(params[:search], params[:page])
		end
	end

	def destroy
		@pending = Pending.find(params[:id]).destroy
		flash[:success] = "Pending destroyed."
		@pendings = Pending.search(params[:search], params[:page])
	end

end
