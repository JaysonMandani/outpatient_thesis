class PendingsController < ApplicationController

	layout 'admin'

	before_filter :confirm_logged_in
	before_filter :find_schedules
	before_filter :find_pendings
	before_filter :find_user

	def index
		# @pendings = Pending.find(:all)
		# @date = params[:month] ? Date.parse(params[:month]) : Date.today
		@pendings = Pending.search(params[:search], params[:page])
	end

	def show
		pending = Date.today
		@pendings = Pending.scheduled_on(pending)
		if @pendings
		flash[:notification] = 'Notification'
		return true
		else
		return false
		end
	end

	def new
		@pending = Pending.new
	end

	def create
		@pending = Pending.new(params[:pending])
		if @pending.save
			redirect_to(:action => 'list')	
		else
			render('new')
		end
	end

	def edit
		@pending = Pending.find(params[:id])
	end

	def update
		@pending = Pending.find(params[:id])
		if @pending.update_attributes(params[:pending])
			redirect_to(:action => 'list')	
		else
			render('edit')
		end
	end

	def delete
		@pending = Pending.find(params[:id])
	end

	def destroy
		pending = Pending.find(params[:id])
		pending.destroy
		flash[:notice] = "Pending destroyed."
		redirect_to(:action => 'list')
	end

end
