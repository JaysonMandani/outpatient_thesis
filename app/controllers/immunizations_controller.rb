class ImmunizationsController < ApplicationController
  
  layout 'admin'

  before_filter :find_pediatric
  before_filter :confirm_logged_in
  before_filter :confirm_admin, :except => [:list, :new, :create, :create_new, :add_new, :show]
  before_filter :find_user
  before_filter :load

  def load
    @immunizations = Immunization.where(:pediatric_id => @pediatric.id)
    @immunization = Immunization.new(:pediatric_id => @pediatric.id)
  end

  def show
    @immunization = Immunization.find(params[:id])
  end

  def create
    @immunization = Immunization.new(params[:immunization])
    if @immunization.save
      flash[:success] = "Immunization has been created."
      @immunizations = Immunization.where(:pediatric_id => @pediatric.id)
    end
  end

  def edit
    @immunization = Immunization.find(params[:id])
  end

  def change
    @immunization = Immunization.find(params[:id])
    if @immunization.update_attributes(params[:immunization])
      flash[:success] = "Immunization has been updated."
      @immunizations = Immunization.where(:pediatric_id => @pediatric.id)
    end
  end

  def destroy
    @immunization = Immunization.find(params[:id]).destroy
    flash[:success] = "Immunization destroyed."
    @immunizations = Immunization.where(:pediatric_id => @pediatric.id)
  end

  private

  def find_pediatric
    if params[:pediatric_id]
      @pediatric = Pediatric.find_by_id(params[:pediatric_id])
    end
  end

end
