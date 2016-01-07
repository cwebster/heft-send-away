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

	def edit
		begin
			@laboratory = Laboratory.find(params[:id])
			authorize @laboratory
		rescue ArgumentError
			return render(:partial => 'record_not_found', :layout => 'application', :status => :not_found)
		end
	end

	def update
		@laboratory = Laboratory.find(params[:id])
		authorize @laboratory
		if @laboratory.update_attributes(laboratory_params)
			# Handle a successful update.
			flash[:success] = "Labortory updated"
      redirect_to laboratory_path
		else
			render 'edit'
		end
	end

	def show
    @laboratory = Laboratory.find(params[:id])
		authorize @laboratory
	end

	def labs_out_of_date
		@laboratories = Laboratory.where(["date_completed < ?", 6.months.ago]).order(:date_completed).page params[:page]
		authorize @laboratories
		render 'index'
	end

	def out_of_date
		@howFarBack = params[:months_out]
		laboratories = Laboratory
										.where(["date_completed < ?", params[:months_out].to_i.months.ago])
										.order(:date_completed)
										render :layout => 'blank'
	end

	def laboratory_params
		params.require(:laboratory).permit(:laboratory_name, :address1, :address2,
		:address3, :city, :postcode, :telephone, :website, :cpa_status, :cpa_reference_number,
		:contact_name, :date_completed, :selection_form_completed, :website_updated)
	end

end
