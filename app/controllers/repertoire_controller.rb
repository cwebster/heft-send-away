class RepertoireController < ApplicationController
  def index

  end
  
  def repertoire_for_laboratory
    @laboratory = Laboratory.find(params[:laboratory_id])
    @repertoire = Repertoire.where(laboratory_id: @laboratory)
  end
  
  def add_to_repertoire
    @laboratory = Laboratory.find(params[:laboratory_id])
    @laboratory_tests = LaboratoryTest.all
  
  end
end
