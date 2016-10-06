class LaboratoryTestController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.admin?
      @laboratory_tests = LaboratoryTest.all.page params[:page]
    else
      @laboratory_tests = LaboratoryTest.where(laboratory_id: current_user.laboratories).page params[:page]
    end
      # authorize @laboratory_tests
  end

  def tests_for_laboratory
    @laboratory_id = params[:laboratory_id]
    @laboratory_tests = LaboratoryTest.where(laboratory_id: @laboratory_id)
    respond_to do |format|
      format.js
      format.html
    end
  end

  def edit
    begin
      @laboratory_test = LaboratoryTest.find(params[:id])
      # authorize @laboratory_test
    rescue ArgumentError
      return render(:partial => 'record_not_found', :layout => 'application', :status => :not_found)
    end
  end

  def update
    @laboratory_test = LaboratoryTest.find(params[:id])
      # authorize @laboratory_test
    if @laboratory_test.update_attributes(laboratory_test_params)
      # Handle a successful update.
      flash[:success] = "Labortory test updated"
      redirect_to laboratory_test_path
    else
      render 'edit'
    end
  end

  def show
    @laboratory_test = LaboratoryTest.find(params[:id])
    # authorize @laboratory_test
  end

  def laboratory_test_params
    params.require(:laboratory_test).permit(:analyte_name, :methodology, :reference_range,
    :sample_type, :cost_of_test, :uncertainty_of_measurement, :eqa_status, :ukas_status, :email,
    :sample_volume, :date_test_information_updated, :ukas_reference_number, :eqa_performance)
  end

end
