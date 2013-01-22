class AccessController < ApplicationController
  
  layout 'admin'

  before_filter :confirm_logged_in
  before_filter :find_schedules
  before_filter :find_pendings

  def index
  	home
  	render('home')
  end

  def home
    user_id = session[:user_id]
    @user = AdminUser.find(user_id)
    birthdate = @user.birthdate
    birthday_today = Date.today
    if birthdate.to_date.strftime("%B %d") == birthday_today.to_date.strftime("%B %d")
      update_age =  @user.age + 1
      flash[:greetings] = 'Notification'
    end

  end

end
