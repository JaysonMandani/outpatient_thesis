class AdminUsersController < ApplicationController
  
  layout 'admin'
  
  before_filter :confirm_logged_in
  before_filter :confirm_admin, :except => [:index, :edit, :update]
  before_filter :find_schedules
  before_filter :find_pendings
  before_filter :find_user
  before_filter :load

  def load
    @admin_users = AdminUser.search(params[:search], params[:page])
    @admin_user = AdminUser.new
  end
  
  def index
    adminuser = session[:user_id]
    username = session[:username]
    user = AdminUser.find(adminuser)
    unless user.admin == true
      @admin_users = AdminUser.where(:username => username)
    else
      @admin_users = AdminUser.search(params[:search], params[:page])
    end
  end

  def create
    @admin_user = AdminUser.new(params[:admin_user])
    if @admin_user.save
      flash[:success] = 'Admin user has been created.'
      @admin_users = AdminUser.search(params[:search], params[:page])
    end
  end

  def edit
    @admin_user = AdminUser.find(params[:id])
  end

  def update
    @admin_user = AdminUser.find(params[:id])
    if @admin_user.update_attributes(params[:admin_user])
      flash[:success] = 'Admin user has been updated.'
      @admin_users = AdminUser.search(params[:search], params[:page])
    end
  end
  
  def destroy
    @admin_user = AdminUser.find(params[:id]).destroy
    flash[:success] = "Admin user destroyed."
    @admin_users = AdminUser.search(params[:search], params[:page])
  end
  
end
