class UsersController < ApplicationController
	before_action :get_user, only: [:show, :edit]
	before_action :authenticate_user!, only: [:edit, :update]
	def show
		@user = User.find(params[:id])
		@user_proto = @user.prototypes.order(id: :ASC).page(params[:page]).per(8)
	end
	def edit
	end
	def update
		if current_user.update(update_params)
			redirect_to(root_path)
			flash[:success] = "成功"
		else
			redirect_to(edit_user_path)
			flash[:warning] = "失敗"
		end
	end

	private
	def update_params
		params.require(:user).permit(:nickname, :email, :member, :profile, :works, :avatar)
	end
	def get_user
		@user = User.find(params[:id])
	end
end
