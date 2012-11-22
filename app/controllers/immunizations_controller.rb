class ImmunizationsController < ApplicationController
  
  layout 'admin'

before_filter :find_pediatric
before_filter :confirm_logged_in
before_filter :confirm_admin, :except => [:list, :new, :create, :show]

def index

end

def list
  @immunizations = Immunization.where(:pediatric_id => @pediatric.id)
end

def show
  @immunization = Immunization.find(params[:id])
end

def new
  @immunization = Immunization.new(:pediatric_id => @pediatric.id)
  @pediatrics = Pediatric.find(params[:pediatric_id])
end

def create_new
  @immunization = Immunization.new(params[:immune])
  if @immunization.save
    redirect_to(:controller => 'pediatrics', :action => 'examination', :id => @immunization.pediatric_id)  
  else
    render('new')
  end
end

def create
  @immunization = Immunization.new(:pediatric_id => @pediatric.id)
  @pediatrics = Pediatric.find(params[:pediatric_id])
end

def add_new
  @immunization = Immunization.new(params[:immune])
  if @immunization.save
    redirect_to(:action => 'list', :pediatric_id => @immunization.pediatric_id )  
  else
    render('new')
  end
end

def edit
  @immunization = Immunization.find(params[:id])
end

def update
  @immunization = Immunization.find(params[:id])
  if @immunization.update_attributes(params[:immunization])
    @immunizations = Pediatric.find(params[:pediatric_id])
    redirect_to(:action => 'list', :pediatric_id => @immunizations.id) 
  else
    render('edit')
  end
end

def delete
  @immunization = Immunization.find(params[:id])
end

def destroy
  @immunization = Immunization.find(params[:id])
  if @immunization.destroy
    flash[:notice] = "Immunization destroyed."
  @immunizations = Pediatric.find(params[:pediatric_id])
  redirect_to(:action => 'list', :pediatric_id => @immunizations.id)
  else
    render 'delete'
  end
end

private

def find_pediatric
  if params[:pediatric_id]
    @pediatric = Pediatric.find_by_id(params[:pediatric_id])
  end
end

end
