class SchedulesController < ApplicationController

	layout 'admin'

	before_filter :confirm_logged_in
	before_filter :find_schedules
	before_filter :find_pendings
	before_filter :find_user
	before_filter :load

	def load
		@schedules = Schedule.search(params[:search], params[:page])
		@schedule = Schedule.new
	end

	def index
		# @schedules = Schedule.find(:all)
		# @date = params[:month] ? Date.parse(params[:month]) : Date.today
	end

	def show
		schedule = Date.today
		@schedules = Schedule.scheduled_on(schedule)
		if @schedules
			flash[:notification] = 'Notification'
			return true
		else
			return false
		end
	end

	def create
		@schedule = Schedule.new(params[:schedule])
		if @schedule.save
		  flash[:success] = "Schedule has been created."
		  @schedules = Schedule.search(params[:search], params[:page])
		end
	end

	def edit
		@schedule = Schedule.find(params[:id])
	end

	def update
		@schedule = Schedule.find(params[:id])
		if @schedule.update_attributes(params[:schedule])
			flash[:success] = "Schedule has been updated."
			@schedules = Schedule.search(params[:search], params[:page])
		end
	end

	def destroy
		@schedule = Schedule.find(params[:id]).destroy
		flash[:success] = "Schedule destroyed."
		@schedules = Schedule.search(params[:search], params[:page])
	end

end
