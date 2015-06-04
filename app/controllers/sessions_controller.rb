class SessionsController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	user = User.where(name: user_params[:name]).first
  	if user && user.authenticate(user_params[:password])
  		log_in(user)
  		redirect_to posts_path
  	else
  		redirect_to new_session_path
  	end
  end

  def destroy
    session[:user_id] = nil
    redirect_to posts_path
  end

private
  def user_params
  	params.require(:user).permit(:email,:password)
  end
end
