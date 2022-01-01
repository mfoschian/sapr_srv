require 'pdf/BaseReport'

module Pdf
	class TestReport < Pdf::BaseReport
		def build
			@pdf.text "Che Cisto"
		end
	end
end