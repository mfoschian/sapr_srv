require 'pdf/BaseReport'

module Pdf
	class TestReport < Pdf::BaseReport

		def initialize(logger)
			super
		end

		def headers
			[
				[
					{content: "Data", rowspan: 2},
					{content: "Orario", colspan: 2},
					"LUOGO",
					{content: "Sapr", rowspan: 2},
					{content: "VOLO", rowspan: 2},
					"PIC"
				],
				[
					"InizioX", "Fine",
					"Località o Coordinate",
					"Pilota In Comando"
				]
			]
		end

		def get_data
			res = []
			last_dt = nil
			flight_count = 0
			Mission.where("dt_start IS NOT NULL")
				.joins(:activity)
				.order( dt_start: :asc, dt_end: :asc ).each do |m|

				m_day = m.dt_start.strftime("%-d/%-m/%Y")
				if last_dt.nil?
					last_dt = m_day
					flight_count = 1
				elsif last_dt != m_day
					last_dt = m_day
					flight_count = 1
				else
					flight_count += 1
				end
				a = m.activity
				res << [ 
					m_day,
					m.dt_start.nil? ? "" : m.dt_start.strftime("%R"),
					m.dt_end.nil? ? "" : m.dt_end.strftime("%R"),
					a.locality.nil? ? "#{a.lat},#{a.lon}" : a.locality,
					"UAV_1",
					flight_count,
					"Pilota X"
				]
			end
			return res
			# [ [Date.new.to_s, "t1", "t2", "Qualche posto", "UAV_1", 1, "Marco Caco"] ]
		end

		def build
			data = headers.concat( get_data() )
			@pdf.table( data,
				width: @pdf.bounds.width,
				cell_style: {padding: 2},
				:row_colors => ["F0F0F0", "FFFFCC"]
			) do
				hh = row(0..1)
				hh.font_style = :bold
				hh.background_color = "CCCCCC"

			end
		end
	end
end