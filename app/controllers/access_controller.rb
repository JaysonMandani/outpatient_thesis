class AccessController < ApplicationController
  
  layout 'admin'

  before_filter :confirm_logged_in
  before_filter :find_schedules

  def index
  	home
  	render('home')
  end

  def home
    user_id = session[:user_id]
    @user = AdminUser.find(user_id)
    birthdate = @user.birthdate
    birthday_today = Date.today
    if birthdate.strftime("%B %e") == birthday_today.strftime("%B %e")
      update_age =  @user.age + 1
      flash[:greetings] = 'Notification'
    end

  end

end
