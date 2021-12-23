class EquipmentTypesController < ApplicationController
	def index
		items = EquipmentType.all
		render json: items
	end
end