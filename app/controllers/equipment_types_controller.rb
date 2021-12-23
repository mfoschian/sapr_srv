class EquipmentTypesController < ApplicationController
	def index
		items = {}
		EquipmentType.all.each do |item|
			items[ item.id ] = item.config
		end
		render json: items
	end
end