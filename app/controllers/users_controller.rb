class UsersController < ApplicationController
  layout 'admin'
  
  before_filter :confirm_logged_in
  before_filter :find_schedules
  before_filter :find_pendings
  before_filter :load

  def load
    @users = User.search(params[:search], params[:page])
    @user = User.new
  end
  
  def index
    user = session[:user_id]
    username = session[:username]
    user = User.find(user)
    unless user.admin == true
      @users = User.where(:username => username)
    else
      @users = User.search(params[:search], params[:page])
    end
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = 'Admin user has been created.'
      @users = User.search(params[:search], params[:page])
      username = @user.audits.find(:last)
      username.update_attributes!(:username => current_user.username.to_s)
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = 'Admin user has been updated.'
      @users = User.search(params[:search], params[:page])
      username = @user.audits.find(:last)
      username.update_attributes!(:username => current_user.username.to_s)
    end
  end
  
  def destroy
    @user = User.find(params[:id]).destroy
    flash[:success] = "Admin user destroyed."
    @users = User.search(params[:search], params[:page])
    username = @user.audits.find(:last)
    username.update_attributes!(:username => current_user.username.to_s)
  end
end
