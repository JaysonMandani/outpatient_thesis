class ImmunizationsController < ApplicationController
  
  layout 'admin'

  before_filter :find_pediatric
  before_filter :confirm_logged_in
  before_filter :confirm_admin, :except => [:list, :new, :create, :create_new, :add_new, :show]
  before_filter :load
  before_filter :find_user

  def load
    @immunizations = Immunization.all
    @immunization = Immunization.new(:pediatric_id => @pediatric.id)
    @pediatrics = Pediatric.find(params[:pediatric_id])
  end

  def index

  end

  def show
    @immunization = Immunization.where(:pediatric_id => @pediatric.id)
  end

  def create
    @immunization = Immunization.new(params[:immune])
    if @immunization.save
      redirect_to pediatrics_path(:id => @immunization.pediatric_id)  
      @immunizations = Immunization.all
    end
  end

  def edit
    @immunization = Immunization.find(params[:id])
  end

  def update
    @immunization = Immunization.find(params[:id])
    if @immunization.update_attributes(params[:immunization])
      @immunizations = Pediatric.find(params[:pediatric_id])
      @immunizations = Immunization.all
      redirect_to pediatrics_path
    end
  end

  def destroy
    @immunization = Immunization.find(params[:id])
    if @immunization.destroy
      flash[:notice] = "Immunization destroyed."
    @immunizations = Pediatric.find(params[:pediatric_id])
    redirect_to(:action => 'list', :pediatric_id => @immunizations.id)
    @immunizations = Immunization.all
    end
  end

  private

  def find_pediatric
    if params[:pediatric_id]
      @pediatric = Pediatric.find_by_id(params[:pediatric_id])
    end
  end

end
