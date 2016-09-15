class CommentsController < ApplicationController
	def create
		@prototype = Prototype.find(params[:prototype_id])
		current_user.comments.create(comment_params)
		@comments = @prototype.comments
		@comment = Comment.new
	end
	private
	def comment_params
		params.require(:comment).permit(:comment).merge(prototype_id: params[:prototype_id])
	end
end
