class MissionsController < ApplicationController
	def index
		items = Mission.all
		render json: items
	end
end