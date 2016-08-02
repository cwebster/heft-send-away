class RepertoireController < ApplicationController
  def index

  end

  def repertoire_for_laboratory
    @laboratory = Laboratory.find(params[:laboratory_id])
    @repertoire = Repertoire.where(laboratory_id: @laboratory)
  end

  def build_repertoire
    @laboratory = Laboratory.find(params[:laboratory_id])
    @laboratory_tests = LaboratoryTest.all
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
  
  private
  
end
