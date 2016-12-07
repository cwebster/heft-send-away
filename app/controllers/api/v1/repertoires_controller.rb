# app/controllers/api/v1/posts_controller.rb
class Api::V1::RepertoiresController < Api::V1::BaseController
  def index
    repertoires = Repertoire.where(laboratory_id: params[:laboratory_id])
    render json: serialize_models(repertoires)
  end

  def show
    repertoires = RepertoireLookup.where(host_laboratory_id: params[:id])
    render json: serialize_models(repertoires)
  end

  def referral_laboratories
  	@referral_laboratories = RepertoireLookup.where(host_laboratory_id: params[:id])
  end
end
