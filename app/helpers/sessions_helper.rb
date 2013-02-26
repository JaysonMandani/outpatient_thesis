module SessionsHelper

	def log_in(user)
		cookies.permanent[:remember_token] = user.remember_token
		self.current_user = user	
	end

	def log_in?
		!current_user.nil?
	end

	def current_user=(user)
		@current_user = user
	end

	def current_user
		@current_user ||= User.find_by_remember_token(cookies[:remember_token])
	end

	def current_user?(user)
		user == current_user
	end

	def confirm_logged_in
		unless log_in?
			store_location
			flash[:notice] = "Unable to proceed please log in first."
  			redirect_to root_path
		end
	end

	def log_out
		session[:user_id] = nil
    session[:username] = nil
		self.current_user = nil
		cookies.delete(:remember_token)
	end

	def redirect_back_or(default)
		redirect_to(session[:return_to] || default)
		session.delete(:return_to)
	end

	def store_location
		session[:return_to] = request.fullpath
	end

end
