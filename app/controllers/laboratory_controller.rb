class LaboratoryController < ApplicationController
  before_action :authenticate_user!

  include Labels

  def index
    @laboratories = Laboratory.where(user_id: current_user).page params[:page]

    authorize @laboratories
  end

  def edit
    begin
      @laboratory = Laboratory.find(params[:id])
#       authorize @laboratory
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
    build_dashboard(laboratory_id: @laboratory.id)
  end

  def build_dashboard(laboratory_id: )
    @dashboard_data = {}
    @dashboard_data["total_tests"] = Repertoire.tests_for_laboratory(laboratory_id:laboratory_id).count
    @dashboard_data["labs_out_of_date"] = Repertoire.information_out_of_date_since(months: 6, laboratory_id: laboratory_id).count
    @dashboard_data["waiting_for_updated_information"] = Repertoire.waiting_for_updated_information(laboratory_id: laboratory_id).count
    @dashboard_data["information_updated_but_not_complete_for_laboratory"] = Repertoire.information_updated_but_not_complete_for_laboratory(laboratory_id: laboratory_id).count
    @dashboard_data["records_complete"] = Repertoire.send_away_records_complete(laboratory_id: laboratory_id).count
  end

  def labs_out_of_date
    @laboratories = Laboratory.where(["date_information_updated < ?", 6.months.ago]).order(:date_information_updated).page params[:page]
    authorize @laboratories
    render 'index'
  end

  def out_of_date
    @howFarBack = params[:months_out]
    @laboratories = Laboratory.out_of_date(params[:months_out].to_i)
    Laboratory.out_of_date_update_letter_send(params[:months_out].to_i)

    respond_to do |format|
      format.html {render 'form_letters', :layout => 'print'}
      format.csv { out_of_date_letter_send }
    end
  end

  def out_of_date_test
    @howFarBack = params[:months_out]
    @laboratories = Laboratory.out_of_date(params[:months_out].to_i)
    respond_to do |format|
      format.html {render 'form_letters', :layout => 'print'}
      format.csv { out_of_date_letter_send }
    end
  end

  def out_of_date_letter_send
    @laboratories = Laboratory.out_of_date(params[:months].to_i)
    Laboratory.where(:id =>@laboratories.pluck(:id))
    .update_all(:date_request_for_information_sent => Date.today)
    render text: @laboratories.to_csv
  end

  def waiting_for_update
    @labs_waiting = Laboratory.waiting_for_update
  end

  def laboratory_params
    params.require(:laboratory).permit(:laboratory_name, :address1, :address2,
    :address3, :city, :postcode, :telephone, :website, :cpa_status, :cpa_reference_number,
    :contact_name, :date_selection_form_completed, :selection_form_completed, :website_updated)
  end

end
