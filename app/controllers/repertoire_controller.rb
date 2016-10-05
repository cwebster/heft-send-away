class RepertoireController < ApplicationController
  def index
    @repertoire = Repertoire.where(laboratory_id: @laboratory)
  end
  
  def edit
    @repertoire = Repertoire.find(params[:id])
  end

  def repertoire_for_laboratory
    @laboratory = Laboratory.find(params[:laboratory_id])
    @repertoire = Repertoire.where(laboratory_id: @laboratory)
  end

  def build_repertoire
    @laboratory = Laboratory.find(params[:laboratory_id])
    @laboratory_tests = LaboratoryTest.all
  end

  def repertoire_by_referral_laboratory
    @laboratory = Laboratory.find(params[:laboratory_id])
    @referral_laboratories = RepertoireLookup.where(host_laboratory_id: @laboratory.id)
    
  end
  
  def update
    @repertoire = Repertoire.find(params[:id])
      # authorize @repertoire
    if @repertoire.update_attributes(repertoire_params)
      # Handle a successful update.
      flash[:success] = "Labortory updated"
      redirect_to repertoire_for_laboratory_url(laboratory_id: @repertoire.laboratory)
    else
      render 'edit'
    end
  
  end

  def add_to_repertoire
    # Get current repertoire 
    
    lab_id = params[:laboratory_id]
    current_repertoire = Repertoire.where(laboratory_id: lab_id).pluck(:laboratory_test_id)
    
    unless params[:checks].nil?
      Repertoire.add_to_repertoire_func(checkboxes: params[:checks], current_repertoire_arr: current_repertoire)
    end
    
    # if current_repertoire is empty then results are synced. If there is still test_ids
    # in the array, these need deleting from the current repertoire
    unless current_repertoire.empty?
      Repertoire.delete_from_repertoire(lab_id: lab_id, tests_to_delete: current_repertoire)
    end
    
    redirect_to repertoire_for_laboratory_url(laboratory_id: lab_id)
  end
  
  def repertoire_params
    params.require(:repertoire).permit(:local_department_id, :date_selection_form_completed, :selection_form_completed, 
                                       :website_updated, :date_request_for_information_sent,
                                       :date_information_updated, :record_complete, :inactive, :date_inactive)
  end
  
  private
  
end
