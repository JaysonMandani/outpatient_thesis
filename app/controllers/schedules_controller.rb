class SchedulesController < ApplicationController

	layout 'admin'

	before_filter :confirm_logged_in
	before_filter :find_schedules


	def index
		@schedules = Schedule.find(:all)
		@date = params[:month] ? Date.parse(params[:month]) : Date.today
	end

	def list
		@schedules = Schedule.search(params[:search], params[:page])
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

	def new
		@schedule = Schedule.new
	end

	def create
		@schedule = Schedule.new(params[:schedule])
		if @schedule.save
			redirect_to(:action => 'list')	
		else
			render('new')
		end
	end

	def edit
		@schedule = Schedule.find(params[:id])
	end

	def update
		@schedule = Schedule.find(params[:id])
		if @schedule.update_attributes(params[:schedule])
			redirect_to(:action => 'list')	
		else
			render('edit')
		end
	end

	def delete
		@schedule = Schedule.find(params[:id])
	end

	def destroy
		schedule = Schedule.find(params[:id])
		schedule.destroy
		flash[:notice] = "Schedule destroyed."
		redirect_to(:action => 'list')
	end

end
