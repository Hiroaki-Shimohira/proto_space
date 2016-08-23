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
	end
end
