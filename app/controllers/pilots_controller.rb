class PilotsController < ApplicationController
	def index
		items = Pilot.all
		render json: items

		# render json: {
		# 	data: items
		# }
	end
end
