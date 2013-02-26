class ApplicationController < ActionController::Base
  
  # helper :all
  include SessionsHelper

  protect_from_forgery 

  protected

  def confirm_logged_in
  	unless session[:user_id]
  		flash[:notice] = "Unable to proceed please log in first."
  		redirect_to(:controller => 'admin', :action => 'login')
  		return false
  	else
  		return true
  	end
  end

  def find_schedules
    schedule = Date.today
    @schedules = Schedule.scheduled_on(schedule)
      if @schedules
          flash[:schedules]
          return true
        else
          return false
      end
   end

  def find_pendings
    @pendings = Pending.where(:created_at => (Time.now.midnight)..Time.now.midnight + 1.day)
    if @pendings == []
      return false
    else
      flash[:pendings]
      return true
    end
  end

  # def current_user
  #   add_to_audit('login', 'sessions', "John Smith")
  #   super
  # end

  # # admin restrictions
  # def confirm_admin
  #   adminuser = session[:user_id]
  #   user = AdminUser.find(adminuser)
  #   unless user.admin == true
  #     flash[:error] = "You don't have permission to use this action"
  #     if params[:controller] == "immunizations"
  #       redirect_to immunizations_path(:pediatric_id => @pediatric.id)
  #       return false
  #     end
  #     redirect_to root_path
  #   else
  #     return true
  #   end
  # end

end
