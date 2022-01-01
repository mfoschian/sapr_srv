class PilotsController < ApplicationController
	def index
		items = Pilot.all
		render json: items

		# render json: {
		# 	data: items
		# }
	end

	def create
		p = params[:pilot]

		item = {
			name: p[:name],
			user_code: p[:user_code],
			operator_code: p[:operator_code],
			EASA_code: p[:EASA_code]
		}

		begin
			u = Pilot.create( item )
			render json: u
			# render json: {
			# 	success: u.valid?,
			# 	pilot: u,
			# 	errors: u.valid? ? nil : u.errors
			# }
		rescue => exception
			render json: { errors: [{ message: exception }] }
		end
	end

	def update
		a = Pilot.find_by_id( params[:id] )
		if a.nil?
			throw "Not found"
		end

		# TODO: permettere modifiche solo a chi ne ha diritto
		[:name, :user_code, :operator_code, :EASA_code ].each do |k|
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
		item = Pilot.find_by_id( id )

		if item.nil?
			render json: { errors: [ {message: "Pilot not found"} ] }
			return
		end

		item.destroy
		render json: { success: true }
	end
end
