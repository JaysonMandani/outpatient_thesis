class PediaExaminationsController < ApplicationController
 layout 'admin'

  before_filter :find_pediatric
  before_filter :confirm_logged_in
  # before_filter :confirm_admin, :except => [:list, :new, :create, :add_new, :show]
  before_filter :find_user
  before_filter :load

  def load
    @pedia_exams = PediaExamination.where(:pediatric_id => @pediatric.id)
    @pedia_exam = PediaExamination.new(:pediatric_id => @pediatric.id)
  end

  def create
    @pedia_exams = PediaExamination.new(params[:pedia_exam])
    if @pedia_exams.save
      flash[:success] = "Ortho Examination has been created."
      @pedia_exams = PediaExamination.where(:pediatric_id => @pediatric.id)
    end
  end

  def edit
    @pedia_exam = PediaExamination.find(params[:id])
  end

  def change
    @pedia_exams = PediaExamination.find(params[:id])
    if @pedia_exams.update_attributes(params[:pedia_exam])
      flash[:success] = "Ortho Examination has been updated."
      @pedia_exams = PediaExamination.where(:pediatric_id => @pediatric.id)
    end
  end

  def destroy
    @pedia_exams = PediaExamination.find(params[:id]).destroy
    flash[:success] = "Ortho Examination destroyed."
    @pedia_exams = PediaExamination.where(:pediatric_id => @pediatric.id)
  end

  private

  def find_pediatric
    if params[:pediatric_id]
      @pediatric = Pediatric.find_by_id(params[:pediatric_id])
    end 
  end

end
