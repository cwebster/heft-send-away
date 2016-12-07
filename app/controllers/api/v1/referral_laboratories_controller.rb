class Api::V1::ReferralLaboratoriesController < Api::V1::BaseController
	def show
		repertoires = RepertoireLookup.where(host_laboratory_id: params[:id]).select(:referral_laboratory_id)
		render json: serialize_models(repertoires)
	end

	def referral_laboratories
		referral_laboratories = RepertoireLookup.where(host_laboratory_id: params[:host_laboratory_id])
		render json: serialize_models(referral_laboratories)
	end
end