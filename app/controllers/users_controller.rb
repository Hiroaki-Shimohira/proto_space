class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
	end
	def edit
		@user = User.find(params[:id])
	end
	def update
		current_user.update(update_params)
		redirect_to "/"
	end
	private
	def update_params
		params.require(:user).permit(:nickname, :email, :member, :profile, :works)
	end
end