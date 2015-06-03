class UsersController < ApplicationController
  def index
  end

  def new
  	@user = User.new
  end

	def create
		user = User.create(user_params)
		if user.valid?
			#redicret to signed in
			flash[:success] = 'you are registered'
			log_in(user)
			redirect_to patches_path
		else
			flash[:error] = 'registration has failed'
			redirect_to new_user_path
		end
	end

private

	def user_params
		params.require(:user).permit(:email,:password,:password_confirmation)
	end

end
