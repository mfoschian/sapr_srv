module Pdf
	class BaseReport
		def initialize(logger)
			@logger = logger
			@pdf = Prawn::Document.new(page_size: "A4", print_scaling: :none, margin: [30.mm, 10.mm, 15.mm, 10.mm])
			# @pdf.font_families.update(
			# 	"Decima" => {
			# 	:normal => "#{DECIMA_DIR}/DecimaTTWE_Reg.ttf",
			# 	:italic => "#{DECIMA_DIR}/DecimaTTWE_Ita.ttf",
			# 	:bold => "#{DECIMA_DIR}/DecimaTTWE_Bd.ttf",
			# 	:bold_italic => "#{DECIMA_DIR}/DecimaTTWE_BdIta.ttf"
			# 	}
			# )
			# @pdf.font "Decima"
		end

		def render
			file = Tempfile.new('sapr_')
			file.binmode

			build

			@pdf.render(file)
			file.close
			return file
		end

		def build
			# Override here
		end
	end
end