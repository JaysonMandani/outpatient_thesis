class ApplicationController < ActionController::Base
  
  helper :all

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

  # admin restrictions
  def confirm_admin
    adminuser = session[:user_id]
    user = AdminUser.find(adminuser)
    unless user.admin == true
      flash[:notice] = "You don't have permission to use this action"
      redirect_to(:action => 'list')
      if params[:controller] == "immunizations"
        redirect_to(:action => 'list', :pediatric_id => @pediatric.id)
        return false
      else
        return false
      end
        redirect_to(:action => 'list')
    else
      return true
    end
  end

  def find_schedules
    schedule = Date.today
    @schedules = Schedule.scheduled_on(schedule)
      if @schedules
          flash[:notification] = 'Notification'
          return true
        else
          return false
      end
   end

end
