class Prototypes::PopularController < PrototypesController
	def index
		@prototypes = Prototype.order('likes_count DESC').page(params[:page])
		render :index
	end
end
