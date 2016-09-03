class PrototypesController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	def index
		@prototypes = Prototype.order(id: :ASC).page(params[:page]).per(8)
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
	def edit
		@prototype = Prototype.find(params[:id])
		@prototype.capture_images.build
	end
	def update
		prototype = Prototype.find(params[:id])
		prototype.update(prototype_params)
    	redirect_to(root_path)
	end
	def destroy
		prototype = Prototype.find(params[:id])
		if prototype.user_id == current_user.id
			prototype.destroy
			redirect_to(root_path)
		else
			redirect_to(root_path)
			flash[:warning] = "ちゃうやろ"
		end
	end
	private
	def create_params
		params.require(:prototype).permit(:title, :catchcopy, :concept, capture_images_attributes: [:image,:satus])
	end
	def prototype_params
		params.require(:prototype).permit(:title, :catchcopy, :concept, capture_images_attributes: [:image,:satus,:id])
	end
end
