class OrthodonticsController < ApplicationController

	layout 'admin', :except => [:print_records]

	before_filter :confirm_logged_in
	before_filter :confirm_admin, :except => [:index, :new, :create, :show]
	before_filter :find_schedules
	before_filter :find_pendings
	before_filter :load
	before_filter :find_user

  	def load
    	@orthodontics = Orthodontic.search(params[:search], params[:page])
    	@orthodontic = Orthodontic.new
  	end

	def index
	end

	def show
		@orthodontic = Orthodontic.find(params[:id])
	end

	def print_records
		@orthodontic = Orthodontic.where(:orthodontic_id => @orthodontic.id)
		@ortho = Orthodontic.find(params[:orthodontic_id])
	end

	def create
		@orthodontic = Orthodontic.new(params[:orthodontic])
		if @orthodontic.save
		  flash[:success] = "Successfully created record."
		  @orthodontics = Orthodontic.search(params[:search], params[:page])
		end
	end

	def edit
		@orthodontic = Orthodontic.find(params[:id])
	end

	def update
		@orthodontic = Orthodontic.find(params[:id])
		if @orthodontic.update_attributes(params[:orthodontic])
			flash[:success] = "Successfully updated record."
			@orthodontics = Orthodontic.search(params[:search], params[:page])
		end
	end

	def destroy
		@orthodontic = Orthodontic.find(params[:id]).destroy
		flash[:success] = "Orthopedic patient destroyed."
		@orthodontics = Orthodontic.search(params[:search], params[:page])
	end
end

