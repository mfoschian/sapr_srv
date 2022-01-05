class ActivitiesController < ApplicationController
	def index
		items = Activity.all
		render json: items
	end

	def create
		p = params[:activity]

		item = {
			title: p[:title],
			dt: p[:dt],
			municipality_code: p[:municipality_code],
			locality: p[:locality],
			alt: p[:alt].to_f,
			lat: p[:lat].to_f,
			lon: p[:lon].to_f,
			flight_max_height: p[:flight_max_height].to_f,
			category: p[:category].to_i,
			scenary: p[:scenary].to_i,
			flight_type: p[:flight_type].to_i,
			type: p[:type].to_i
		}

		begin
			u = Activity.create!( item )
			render json: u
			# render json: {
			# 	success: u.valid?,
			# 	activity: u,
			# 	errors: u.valid? ? nil : u.errors
			# }
		rescue => exception
			render json: { errors: [{ message: exception }] }
		end
	end

	def update
		a = Activity.find_by_id( params[:id] )
		if a.nil?
			throw "Not found"
		end

		# TODO: permettere modifiche solo a chi ne ha diritto
		[:title, :dt, :municipality_code, :locality ].each do |k|
			if params.has_key?(k)
				a[k] = params[k]
			end
		end

		[:alt, :lat, :lon, :flight_max_height ].each do |k|
			if params.has_key?(k)
				a[k] = params[k].to_f
			end
		end

		[:category, :scenary, :flight_type, :type ].each do |k|
			if params.has_key?(k)
				a[k] = params[k].to_i
			end
		end

		res = a.save
		if res
			render json: {
				item: a
			}
		else
			render json: {
				errors: a.errors
			}
		end
	end

	def destroy
		return not_authorized unless is_admin?

		id = params[:id].to_i
		item = Activity.find_by_id( id )

		if item.nil?
			render json: { errors: [ {message: "Activity not found"} ] }
			return
		end

		item.destroy
		render json: { success: true }
	end

end