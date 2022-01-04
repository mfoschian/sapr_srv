require 'pdf/TestReport'

class ReportsController < ActionController::Base
	def test


		pdf = Pdf::TestReport.new(logger)
		file = pdf.render

		send_file file.path, disposition: :attachment, filename: "test.pdf"

	end
end