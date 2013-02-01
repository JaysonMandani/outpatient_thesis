class OrthodonticsController < ApplicationController

	layout 'admin'

	before_filter :confirm_logged_in
	before_filter :confirm_admin, :except => [:index, :new, :create, :show]
	before_filter :find_schedules
	before_filter :find_pendings

	def index
		@orthodontics = Orthodontic.search(params[:search], params[:page])
	end

	def show
		@orthodontic = Orthodontic.find(params[:id])
	end

	def new
		@orthodontic = Orthodontic.new
	end

	def create
		@orthodontic = Orthodontic.new(params[:ortho])
		if @orthodontic.save
			redirect_to(:action => 'list')	
		else
			@full_name = params[:full_name]
			render :template => 'orthodontics/new'
		end
	end

	def edit
		@orthodontic = Orthodontic.find(params[:id])
	end

	def update
		@orthodontic = Orthodontic.find(params[:id])
		if @orthodontic.update_attributes(params[:orthodontic])
			redirect_to(:action => 'show', :id => @orthodontic.id)	
		else
			render('edit')
		end
	end

	def delete
		@orthodontic = Orthodontic.find(params[:id])
	end

	def destroy
		orthodontic = Orthodontic.find(params[:id])
		orthodontic.delete
		flash[:notice] = "Orthopedic patient destroyed."
		redirect_to(:action => 'list')
	end

end
