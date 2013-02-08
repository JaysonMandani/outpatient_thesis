class OrthodonticsController < ApplicationController

	layout 'admin'

	before_filter :confirm_logged_in
	before_filter :confirm_admin, :except => [:index, :new, :create, :show]
	before_filter :find_schedules
	before_filter :find_pendings
	before_filter :load

  	def load
    	@orthodontics = Orthodontic.search(params[:search], params[:page])
    	@orthodontic = Orthodontic.new
  	end

	def index
	end

	def show
		@orthodontic = Orthodontic.find(params[:id])
	end

	def create
		@orthodontic = Orthodontic.new(params[:orthodontic])
		if @orthodontic.save
		  flash[:notice] = "Successfully created record."
		  @orthodontics = Orthodontic.search(params[:search], params[:page])
		end
	end

	def edit
		@orthodontic = Orthodontic.find(params[:id])
		@header = puts "Edit"
	end

	def update
		@orthodontic = Orthodontic.find(params[:id])
		if @orthodontic.update_attributes(params[:orthodontic])
			flash[:notice] = "Successfully updated record."
			@orthodontics = Orthodontic.search(params[:search], params[:page])
		end
	end

	def destroy
		@orthodontic = Orthodontic.find(params[:id])
		@orthodontic.destroy
		flash[:notice] = "Orthopedic patient destroyed."
		@orthodontics = Orthodontic.search(params[:search], params[:page])
	end
end

