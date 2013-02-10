class PediatricsController < ApplicationController

	layout 'admin'

	before_filter :find_pediatric
	before_filter :confirm_logged_in
	before_filter :confirm_admin, :except => [:index, :new, :create, :show]
	before_filter :find_schedules
	before_filter :find_pendings
	before_filter :load

	def load
		@pediatrics = Pediatric.search(params[:search], params[:page])
		@pediatric = Pediatric.new
	end

	def index
	end

	def show
		@pediatric = Pediatric.find(params[:id])
	end

	def create
		@pediatric = Pediatric.new(params[:pediatric])
		if @pediatric.save
			flash[:notice] = "Successfully created record."	
			@pediatrics = Pediatric.search(params[:search], params[:page])
		end
	end

	def examination
		#show the examination content
		@pediatric = Pediatric.find(params[:id])
	end

	def create_examination
		@pediatric = Pediatric.find(params[:id])
		if @pediatric.update_attributes(params[:pedia])
			flash[:notice] = "Successfully created record."
			@pediatrics = Pediatric.search(params[:search], params[:page])
		end
	end

	def edit
		@pediatric = Pediatric.find(params[:id])
	end

	def update
		@pediatrics = Pediatric.find(params[:id])
		if @pediatrics.update_attributes(params[:pediatric])
			flash[:notice] = "Successfully created record."
			@pediatrics = Pediatric.search(params[:search], params[:page])
		end
	end

	def destroy
		@pediatric = Pediatric.find(params[:id]).destroy
		flash[:notice] = "Pediatric patient destroyed."
		@pediatrics = Pediatric.search(params[:search], params[:page])
	end

	private

	def find_pediatric
	  if params[:id]
	    @pediatric = Pediatric.find_by_id(params[:id])
	  end
	end
end

