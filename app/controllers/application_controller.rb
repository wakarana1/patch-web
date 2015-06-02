class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception

	helper_method :current_user

protected
	#return current user or if the @user doesn't exist, assign the result of User.find to @user
	#only attempt User.find if there is :user_id stored in the session. 
  def current_user
  	@current_user ||= User.find session[:user_id] if session[:user_id]
  end

end
