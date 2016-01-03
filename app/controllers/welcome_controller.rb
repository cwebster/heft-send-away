class WelcomeController < ApplicationController
	def index

		if current_user.nil? || !current_user.admin?

		else
			@labs_gtr_6_months = Laboratory.where(["date_completed > ?", 6.months.ago])
			@total_labs = Laboratory.count
			@lab_tests = LaboratoryTest.where(
				{ukas_status: ''})
			@total_lab_tests = LaboratoryTest.count
		end


	end

end
