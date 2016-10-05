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
		@prototype.tag_list.add(prototype_tags_params)
		if prototype_main_image.nil?
			redirect_to(new_prototype_path)
			flash[:warning] = "メイン画像も設定してね！"
		else
		    @prototype.save(prototype_params)
			redirect_to(root_path)
			flash[:success] = "いいね！"
		end
	end
	def edit
		@prototype.capture_images.build
	end
	def update
		@prototype.tag_list.add(prototype_tags_params)
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
		params.require(:prototype).permit(:title, :catchcopy, :concept, capture_images_attributes: [:url,:satus,:id])
	end
	def prototype_tags_params
		params.require(:prototype)[:tag_list]
	end
	def prototype_main_image
		#main_imageがあるかどうか判断する
		params.require(:prototype)["capture_images_attributes"]["0"]["url"]
	end
end
