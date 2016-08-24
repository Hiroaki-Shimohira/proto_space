class PrototypesController < ApplicationController
	def index
	end
	def show
	end
	def new
		@prototype = Prototype.new
	end
	def create
		binding.pry
		Prototype.create(create_params)

	end
	private
	def create_params
		params.require(:prototype).permit(:title, :catchcopy, :concept)
	end
	def image_params
		params.require(:capture_image).permit(:image)
	end
end
