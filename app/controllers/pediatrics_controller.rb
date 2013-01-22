class PediatricsController < ApplicationController

layout 'admin'

before_filter :find_pediatric
before_filter :confirm_logged_in
before_filter :confirm_admin, :except => [:list, :new, :create, :show]
before_filter :find_schedules
before_filter :find_pendings

def index

end

def list
	@pediatrics = Pediatric.search(params[:search], params[:page])
end

def show
	@pediatric = Pediatric.find(params[:id])
end

def new
	@pediatric = Pediatric.new
end

def create
	@pediatric = Pediatric.new(params[:pediatric])
	if @pediatric.save
		redirect_to(:controller => 'immunizations', :action => 'new', :pediatric_id => @pediatric.id)	
	else
		render('new')
	end
end

def examination
	#show the examination content
	@pediatric = Pediatric.find(params[:id])
end

def create_examination
	@pediatric = Pediatric.find(params[:id])
	if @pediatric.update_attributes(params[:pedia])
		redirect_to(:controller => 'pediatrics', :action => 'list')
	else
		render('examination')
	end
end

def edit
	@pediatric = Pediatric.find(params[:id])
end

def update
	@pediatrics = Pediatric.find(params[:id])
	if @pediatrics.update_attributes(params[:pediatric])
		redirect_to(:action => 'show', :id => @pediatrics.id)	
	else
		render('edit')
	end
end

def delete
	@pediatric = Pediatric.find(params[:id])
end

def destroy
	Pediatric.find(params[:id]).destroy
	flash[:notice] = "Pediatric patient destroyed."
	redirect_to(:action => 'list')
end

private

def find_pediatric
  if params[:id]
    @pediatric = Pediatric.find_by_id(params[:id])
  end
end

end

