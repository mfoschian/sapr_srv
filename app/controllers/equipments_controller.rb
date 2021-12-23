class EquipmentsController < ApplicationController
	def index
		items = Equipment.all
		render json: items
	end
end