class CommentsController < ApplicationController
	def create
		binding.pry
		@prototype = Prototype.find(params[:prototype_id])
		current_user.comments.create(comment_params)
		redirect_to(prototype_path(@prototype))
	end
	private
	def comment_params
		params.require(:comment).permit(:comment).merge(prototype_id: params[:prototype_id])
	end
end
