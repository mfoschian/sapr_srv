class UavController < ApplicationController
	def index
		items = Uav.all
		render json: items
	end
end