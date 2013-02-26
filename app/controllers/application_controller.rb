class ApplicationController < ActionController::Base
  
  helper :all
  include SessionsHelper

  protect_from_forgery 

  protected

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

end
