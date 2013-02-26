class SessionsController < ApplicationController
  
  layout 'public'

  before_filter :confirm_logged_in, :except => [:login, :attempt_login, :logout, :forgot_password, :retrieve_password, :authentication, :find_email]

  def index
  	login
  	render ('login')
  end

  def login
  	session[:user_id] = nil
    session[:username] = nil
  end
  
  def attempt_login
  	authorized_user = User.authenticate(params[:username], params[:password])
  	if authorized_user
  		session[:user_id] = authorized_user.id
      session[:username] = authorized_user.username
      admin = authorized_user.admin == true
      if admin
    		flash[:success] = "Hello! administrator you are now logged in."
    		session[:remember_token] = authorized_user.remember_token
        log_in authorized_user
        redirect_back_or home_path
      else
        flash[:success] = "You are now logged in."
        session[:remember_token] = authorized_user.remember_token
        log_in authorized_user
        redirect_back_or home_path
      end
  	else 
  		flash[:notice] = "Incorrect username/password."
  		redirect_to(:action => 'login')
 	  end
  end

  def logout
    log_out
  	session[:user_id] = nil
    session[:username] = nil
  	redirect_to(:action => "login")
  end

  def forgot_password
    
  end

  def find_email
    email = User.email_address(params[:email])
    if email
      @users = email.id
      redirect_to(:action => 'authentication', :id => @users)
    else
      flash[:notice] = "Email address does not exist."
      redirect_to(:action => "forgot_password")
    end
  end

  def authentication
    @secrets = User.find(params[:id])
  end

  def retrieve_password
    @secrets = User.find(params[:id])
    authorized_secret = User.authenticate_secret(params[:secret_q], params[:secret_a])
    if authorized_secret
      session[:user_id] = authorized_secret.id
      session[:username] = authorized_secret.username
      redirect_to(:action => 'change_password', :id => @secrets)
    else 
      flash[:notice] = "Incorrect secret question and answer combination."
      redirect_to(:action => 'authentication', :id => @secrets)
    end
  end

  def change_password
    @change = User.find(params[:id])
  end

  def update_password
    @change = User.find(params[:id])
    if @change.update_attributes(params[:change])
      flash[:notice] = 'Password Updated'
      redirect_to(:action => 'login')
    else
      render("change_password")
    end
  end

end
