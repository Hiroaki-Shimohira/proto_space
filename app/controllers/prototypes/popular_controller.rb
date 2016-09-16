class Prototypes::PopularController < PrototypesController
	def index
		@prototypes = Prototype.order('likes_count DESC').page(params[:page]).per(8)
		render :index
	end
end