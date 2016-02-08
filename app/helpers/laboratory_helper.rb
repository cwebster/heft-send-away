module LaboratoryHelper
	def ukas_status_html(status)
		response = ''
		if status.nil?
			response = "Yes/No"
		elsif status == 'Yes'
			response = 'Yes'
		else
			response = 'No'
		end
    return response
	end
end
