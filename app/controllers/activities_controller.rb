class ActivitiesController < ApplicationController
	def index
		items = Activity.all
		render json: items
	end
end