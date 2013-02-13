class ImmunizationsController < ApplicationController
  
  layout 'admin'

  before_filter :find_pediatric
  before_filter :confirm_logged_in
  before_filter :confirm_admin, :except => [:list, :new, :create, :create_new, :add_new, :show]
  before_filter :find_user

  def index
     @immunizations = Immunization.where(:pediatric_id => @pediatric.id)
  end

  def show
    @immunization = Immunization.find(params[:id])
  end

  def new
    @immunization = Immunization.new(:pediatric_id => @pediatric.id)
    @pediatrics = Pediatric.find(params[:pediatric_id])
  end

  def create
    @immunization = Immunization.new(params[:immune])
    if @immunization.save
      flash[:success] = "Immunization has been created."
      @immunizations = Immunization.where(:pediatric_id => @pediatric.id)
    end
  end

  def edit
    @immunization = Immunization.find(params[:id])
  end

  def update
    @immunization = Immunization.find(params[:id])
    if @immunization.update_attributes(params[:immunization])
      flash[:success] = "Immunization has been updated."
      @immunizations = Pediatric.find(params[:pediatric_id])
    end
  end

  def delete
    @immunization = Immunization.find(params[:id])
  end

  def destroy
    @immunization = Immunization.find(params[:id])
    if @immunization.destroy
      flash[:success] = "Immunization destroyed."
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
