class AdminUsersController < ApplicationController
  
  layout 'admin'
  
  before_filter :confirm_logged_in
  before_filter :confirm_admin, :except => [:list, :edit, :update]
  before_filter :find_schedules
  
  def index

  end
  
  def list
    adminuser = session[:user_id]
    username = session[:username]
    user = AdminUser.find(adminuser)
    unless user.admin == true
      @admin_users = AdminUser.where(:username => username)
    else
      @admin_users = AdminUser.search(params[:search], params[:page])
    end
  end

  def new
    @admin_user = AdminUser.new
  end
  
  def create
    @admin_user = AdminUser.new(params[:admin_user])
    if @admin_user.save
      flash[:notice] = 'Admin user has been created.'
      redirect_to(:action => 'list')
    else
      render("new")
    end
  end

  def edit
    @admin_user = AdminUser.find(params[:id])
  end

  def update
    @admin_user = AdminUser.find(params[:id])
    if @admin_user.update_attributes(params[:admin_user])
      flash[:notice] = 'Admin user has been updated.'
      redirect_to(:action => 'list')
    else
      render("edit")
    end
  end
  
  def delete
    @admin_user = AdminUser.find(params[:id])
  end
  
  def destroy
    AdminUser.find(params[:id]).destroy
    flash[:notice] = "Admin user destroyed."
    redirect_to(:action => 'list')
  end
  
end
