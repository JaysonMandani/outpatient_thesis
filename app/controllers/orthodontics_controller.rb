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
	  @orthodontic = Orthodontic.new(params[:orthodontic])

	  respond_to do |format|
	    if @orthodontic.save
	      format.html { redirect_to @orthodontic, notice: 'Post was successfully created.' }
	      format.json { render json: @orthodontic, status: :created, location: @orthodontic }
	    else
	      format.html { render action: "new" }
	      format.json { render json: @orthodontic.errors, status: :unprocessable_entity }
	    end
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
		redirect_to orthodontics_url
	end
end
