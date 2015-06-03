class SessionsController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	user = User.where(email: user_params[:email]).first
  	if user && user.authenticate(user_params[:password])
  		log_in(user)
  		flash[:success] = 'Logged in!'
  		redirect_to posts_path
  	else
  		flash[:error] = "Unable to log you in."
  		redirect_to new_session_path
  	end
  end

  def destroy
    session[:user_id] = nil
    flash[:error] = 'Logged out successfully'
    redirect_to patches_path
  end

private
  def user_params
  	params.require(:user).permit(:email,:password)
  end
end
