class LaboratoryController < ApplicationController
	before_action :authenticate_user!

  def index
		if current_user.admin?
			@laboratories = Laboratory.all.page params[:page]
		else
			@laboratories = Laboratory.where(user_id: current_user)
		end

		authorize @laboratories


	end

end
