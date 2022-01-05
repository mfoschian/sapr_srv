class EquipmentsController < ApplicationController
	def index
		items = Equipment.all
		render json: items
	end


	def create
		p = params[:equipment]

		item = {
			name: p[:name],
			type: p[:type],
			used: p[:used],
			mission_id: p[:mission_id]
		}

		begin
			u = Equipment.create!( item )
			render json: u
			# render json: {
			# 	success: u.valid?,
			# 	equipment: u,
			# 	errors: u.valid? ? nil : u.errors
			# }
		rescue => exception
			render json: { errors: [{ message: exception }] }
		end
	end

	def update
		a = Equipment.find_by_id( params[:id] )
		if a.nil?
			throw "Not found"
		end

		# TODO: permettere modifiche solo a chi ne ha diritto
		[:name, :type, :mission_id ].each do |k|
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
		item = Equipment.find_by_id( id )

		if item.nil?
			render json: { errors: [ {message: "Equipment not found"} ] }
			return
		end

		item.destroy
		render json: { success: true }
	end

	def batch_update

		unless params.has_key?(:equips)
			render json: { errors: "No equipment specified!" }
			return
		end

		equips = params[:equips]
		errors = nil

		Equipment.transaction do
			equips.each do |equip|
				a = Equipment.find_by_id( equip[:id] )
				if a.nil?
					throw "Not found"
				end

				# TODO: permettere modifiche solo a chi ne ha diritto
				[:name, :type, :mission_id ].each do |k|
					if equip.has_key?(k)
						a[k] = equip[k]
					end
				end
				res = a.save
				unless res
					errors = a.errors
					raise ActiveRecord::Rollback
				end
			end
		end
		render json: {
			success: errors.nil?,
			errors: errors
		}
	end

end