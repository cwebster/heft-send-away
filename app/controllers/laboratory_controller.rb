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
    @user_laboratories = Laboratory.where(user_id: current_user)
    @out_of_date_information_array = Repertoire.build_out_of_data_array(laboratories: @user_laboratories)
    @referral_laboratories_array = Repertoire.build_laboratories_array(laboratories: @user_laboratories)
    authorize @user_laboratories
  end

  def labs_out_of_date_labels
    @user_laboratories = Laboratory.where(user_id: current_user)
    @referral_laboratories_array = Repertoire.build_laboratories_array(laboratories: @user_laboratories)
    laboratories = Laboratory.laboratory_objects(laboratories_array: @referral_laboratories_array)
    mailing_labels(laboratories)
    send_data @labels, :filename => "test.pdf", :type => "application/pdf"
  end

  def labs_out_of_date_letters
    @user_laboratories = Laboratory.where(user_id: current_user)
    @out_of_date_information_array = Repertoire.build_out_of_data_array(laboratories: @user_laboratories)
    @laboratories_array = Repertoire.get_laboratories_for_repertoire(repertoires: @out_of_date_information_array )
    respond_to do |format|
      format.html {render 'form_letters', :layout => 'print'}
      format.csv { out_of_date_letter_send }
    end
  end

  def waiting_for_update
    @user_laboratories = Laboratory.where(user_id: current_user)
    @out_of_date_information_array = Repertoire.build_waiting_for_updated_information_array(laboratories: @user_laboratories )
    @referral_laboratories_array = Repertoire.build_laboratories_array(laboratories: @user_laboratories)
  end

  def waiting_for_update_letters
    @user_laboratories = Laboratory.where(user_id: current_user)
    @out_of_date_information_array = Repertoire.build_waiting_for_updated_information_array(laboratories: @user_laboratories )
    @laboratories_array = Repertoire.get_laboratories_for_repertoire(repertoires: @out_of_date_information_array )
    respond_to do |format|
      format.html {render 'waiting_for_update_letters', :layout => 'print'}
      format.csv { out_of_date_letter_send }
    end
  end

  def waiting_for_update_labels
    @user_laboratories = Laboratory.where(user_id: current_user)
    @referral_laboratories_array = Repertoire.build_laboratories_array(laboratories: @user_laboratories)
    laboratories = Laboratory.laboratory_objects(laboratories_array: @referral_laboratories_array)
    mailing_labels(laboratories)
    send_data @labels, :filename => "test.pdf", :type => "application/pdf"
  end

  def updated_but_not_complete
    @user_laboratories = Laboratory.where(user_id: current_user)
    @build_updated_but_not_complete_array = Repertoire.build_updated_but_not_complete_array(laboratories: @user_laboratories )
    @referral_laboratories_array = Repertoire.build_laboratories_array(laboratories: @user_laboratories)
  end

  def updated_but_not_complete_labels
    @user_laboratories = Laboratory.where(user_id: current_user)
    @referral_laboratories_array = Repertoire.build_updated_but_not_complete_array(laboratories: @user_laboratories)

    laboratories = Laboratory.laboratory_objects_from_relation(laboratories_array: @referral_laboratories_array)   
    mailing_labels(laboratories)
    send_data @labels, :filename => "test.pdf", :type => "application/pdf"
  end

  def updated_but_not_complete_letters
    @user_laboratories = Laboratory.where(user_id: current_user)
    @build_updated_but_not_complete_array = Repertoire.build_updated_but_not_complete_array(laboratories: @user_laboratories )
    @laboratories_array = Repertoire.get_laboratories_for_repertoire(repertoires: @build_updated_but_not_complete_array )
    respond_to do |format|
      format.html {render 'updated_but_not_complete_letters', :layout => 'print'}
      format.csv { out_of_date_letter_send }
    end
  end

  def laboratory_params
    params.require(:laboratory).permit(:laboratory_name, :address1, :address2,
      :address3, :city, :postcode, :telephone, :website, :cpa_status, :cpa_reference_number,
      :contact_name, :date_selection_form_completed, :selection_form_completed, :website_updated)
  end

end
