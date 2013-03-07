class OrthoExaminationsController < ApplicationController
  layout 'admin'

  before_filter :find_orthodontic
  before_filter :confirm_logged_in
  before_filter :load
  # before_filter :confirm_admin, :except => [:list, :new, :create, :add_new, :show]

  def load
    @ortho_exams = OrthoExamination.where(:orthodontic_id => @orthodontic.id)
    @ortho_exam = OrthoExamination.new(:orthodontic_id => @orthodontic.id)
  end

  def create
    @ortho_exams = OrthoExamination.new(params[:ortho_exam])
    if @ortho_exams.save
      flash[:success] = "Ortho Examination has been created."
      @ortho_exams = OrthoExamination.where(:orthodontic_id => @orthodontic.id)
    end
  end

  def edit
    @ortho_exam = OrthoExamination.find(params[:id])
  end
  
  def change
    @ortho_exams = OrthoExamination.find(params[:id])
    if @ortho_exams.update_attributes(params[:ortho_exam])
      flash[:success] = "Ortho Examination has been updated."
      @ortho_exams = OrthoExamination.where(:orthodontic_id => @orthodontic.id)
    end
  end

  def destroy
    @ortho_exams = OrthoExamination.find(params[:id]).destroy
    flash[:success] = "Ortho Examination destroyed."
    @ortho_exams = OrthoExamination.where(:orthodontic_id => @orthodontic.id)
  end

  private

  def find_orthodontic
    if params[:orthodontic_id]
      @orthodontic = Orthodontic.find_by_id(params[:orthodontic_id])
    end 
  end
end
