class MissionsController < ApplicationController
	def index
		items = Mission.all
		render json: items
	end

	def create
		p = params[:mission]

		item = {
			activity_id: p[:activity_id],
			dt_start: p[:dt_start],
			dt_end: p[:dt_end],
			uav_setup: p[:uav_setup]
		}

		begin
			u = Mission.create( item )
			render json: u
			# render json: {
			# 	success: u.valid?,
			# 	mission: u,
			# 	errors: u.valid? ? nil : u.errors
			# }
		rescue => exception
			render json: { errors: [{ message: exception }] }
		end
	end

	def update
		a = Mission.find_by_id( params[:id] )
		if a.nil?
			throw "Not found"
		end

		# TODO: permettere modifiche solo a chi ne ha diritto
		[:activity_id, :dt_start, :dt_end, :uav_setup ].each do |k|
			if params.has_key?(k)
				a[k] = params[k]
			end
		end

		res = a.save
		if res
			render json: a
			# render json: {
			# 	item: a
			# }
		else
			render json: {
				errors: a.errors
			}
		end
	end

	def destroy
		return not_authorized unless is_admin?

		id = params[:id].to_i
		item = Mission.find_by_id( id )

		if item.nil?
			render json: { errors: [ {message: "Mission not found"} ] }
			return
		end

		item.destroy
		render json: { success: true }
	end
end