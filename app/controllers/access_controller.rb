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
    @current_user = User.find(user_id)
    birthdate = @current_user.birthdate
    birthday_today = Date.today
    if birthdate.to_date.strftime("%B %d") == birthday_today.to_date.strftime("%B %d")
      update_age =  @current_user.age + 1
      flash[:greetings] = 'Notification'
    end

  end

end
