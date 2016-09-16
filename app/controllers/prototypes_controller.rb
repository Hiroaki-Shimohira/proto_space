class PrototypesController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	before_action :create_prototype_instance, only: [:show, :edit, :update, :destroy]
	def index
		@prototypes = Prototype.order(updated_at: :ASC).page(params[:page])
	end
	def show
		@likes = Like.where(prototype_id: params[:id])
		@comment = Comment.new
		@comments = @prototype.comments
	end
	def new
		@prototype = Prototype.new
		@prototype.capture_images.build
	end
	def create


		@prototype = current_user.prototypes.new(prototype_params)
		if @prototype.save(prototype_params)
			redirect_to(root_path)
			flash[:success] = "いいね！"
		else
			redirect_to(new_prototype_path)
			flash[:warning] = "画像も設定してね！"
		end
	end
	def edit
		@prototype.capture_images.build
	end
	def update
		@prototype.update(prototype_params)
    	redirect_to(root_path)
	end
	def destroy
		if @prototype.user_id == current_user.id
			@prototype.destroy
			redirect_to(root_path)
		else
			redirect_to(root_path)
			flash[:warning] = "ちゃうやろ"
		end
	end
	def create_prototype_instance
		@prototype = Prototype.find(params[:id])
	end
	private
	def prototype_params
		params.require(:prototype).permit(:title, :catchcopy, :concept, capture_images_attributes: [:image,:satus,:id])
	end
end
