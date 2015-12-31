class LaboratoryTestController < ApplicationController
	before_action :authenticate_user!

	def index
		if current_user.admin?
			@laboratory_tests = LaboratoryTest.all.page params[:page]
		else
			@laboratory_tests = LaboratoryTest.where(user_id: current_user)
		end
		authorize @laboratory_tests
	end

	def tests_for_laboratory
		@laboratory_id = params[:laboratory_id]
    @laboratory_tests = LaboratoryTest.where(laboratory_id: @laboratory_id)
		respond_to do |format|
		  format.js
		  format.html
    end
	end
end
