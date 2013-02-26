class PediatricsController < ApplicationController

	layout 'admin', :except => [:print_records]

	before_filter :find_pediatric
	before_filter :confirm_logged_in
	# before_filter :confirm_admin, :except => [:index, :new, :create, :show]
	before_filter :find_schedules
	before_filter :find_pendings
	before_filter :load
	# before_filter :find_immune

	def load
		@pediatrics = Pediatric.search(params[:search], params[:page])
		@pediatric = Pediatric.new
		@immunizations = Immunization.where(:pediatric_id => params[:id])
	end

	def index
	end

	def show
		@pediatric = Pediatric.find(params[:id])
	end

	def print_records
		@pediatric = Pediatric.where(:pediatric_id => @pediatric.id)
		@pedia = Pediatric.find(params[:pediatric_id])
	end

	def create
		@pediatric = Pediatric.new(params[:pediatric])
		if @pediatric.save
			flash[:success] = "Successfully created record."	
			@pediatrics = Pediatric.search(params[:search], params[:page])
		end
	end

	def examination
		#show the examination content
		@examination = Pediatric.find(params[:id])
	end

	def create_examination
		@pediatric = Pediatric.find(params[:id])
		if @pediatric.update_attributes(params[:pedia])
			flash[:success] = "Successfully created record."
			@pediatrics = Pediatric.search(params[:search], params[:page])
		end
	end

	def edit
		@orthodontic = Orthodontic.find(params[:id])
		@pediatric = Pediatric.find(params[:id])
	end

	def update
		@pediatrics = Pediatric.find(params[:id])
		if @pediatrics.update_attributes(params[:pediatric])
			flash[:success] = "Successfully updated record."
			@pediatrics = Pediatric.search(params[:search], params[:page])
		end
	end

	def destroy
		@pediatric = Pediatric.find(params[:id]).destroy
		flash[:success] = "Pediatric patient destroyed."
		@pediatrics = Pediatric.search(params[:search], params[:page])
	end

	private

	def find_pediatric
	  if params[:id]
	    @pediatric = Pediatric.find_by_id(params[:id])
	  end
	end

end

