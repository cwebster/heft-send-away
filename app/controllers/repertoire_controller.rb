class RepertoireController < ApplicationController

  def index
    @repertoire = Repertoire.where(laboratory_id: @laboratory)
  end
  
  def edit
    @repertoire = Repertoire.find(params[:id])
  end

  def repertoire_for_laboratory
    REDIS.set("#{current_user.id}current_lab", params[:laboratory_id])
    @laboratory = Laboratory.find(params[:laboratory_id])
    @repertoire = Repertoire.where(laboratory_id: @laboratory)
  end

  def build_repertoire
    REDIS.set("#{current_user.id}current_lab", params[:laboratory_id])
    @laboratory = Laboratory.find(params[:laboratory_id])
    @laboratory_tests = LaboratoryTest.all
  end

  def repertoire_by_referral_laboratory
    REDIS.set("#{current_user.id}current_lab", params[:laboratory_id])
    @laboratory = Laboratory.find(params[:laboratory_id])
    @referral_laboratories = RepertoireLookup.where(host_laboratory_id: @laboratory.id)
    
  end
  
  def update
    @repertoire = Repertoire.find(params[:id])
      # authorize @repertoire
    if @repertoire.update_attributes(repertoire_params)
      # Handle a successful update.
      flash[:success] = "Labortory updated"
      redirect_to edit_repertoire_url(laboratory_id: @repertoire)
    else
      render 'edit'
    end
  
  end

  def add_to_repertoire
      REDIS.set("#{current_user.id}current_lab", params[:host_laboratory_id])
      host_laboratory = Laboratory.find(params[:host_laboratory_id])
      referral_laboratory_test = LaboratoryTest.find(params[:referral_laboratory_test_id])

      rep = Repertoire.new
      rep.laboratory_id = params[:host_laboratory_id]
      rep.laboratory_test_id = params[:referral_laboratory_test_id]

      respond_to do |format|
      if rep.save
        format.js {render layout: false}
      end
    end
  end
  
  def repertoire_params
    params.require(:repertoire).permit(:local_department_id, :date_selection_form_completed, :selection_form_completed, 
                                       :website_updated, :date_request_for_information_sent,
                                       :date_information_updated, :record_complete, :inactive, :date_inactive)
  end

  def remove_from_repertoire

    repertoire = Repertoire.find(params[:repertoire_id])
    @laboratory_test_id = repertoire.laboratory_test_id


  end
  
  private
  
end
