class PrototypesController < ApplicationController
	def index
		@prototypes = Prototype.order('id ASC').limit(8)
	end
	def show
		@prototype = Prototype.find(params[:id])
	end
	def new
		@prototype = Prototype.new
		@prototype.capture_images.build
	end
	def create


		@prototype = current_user.prototypes.new(create_params)
		if @prototype.save(create_params)
			redirect_to(root_path)
			flash[:success] = "いいね！"
		else
			redirect_to(new_prototype_path)
			flash[:warning] = "画像も設定してね！"
		end

	end
	private
	def create_params
		params.require(:prototype).permit(:title, :catchcopy, :concept, capture_images_attributes: [:image,:satus])
	end
end
