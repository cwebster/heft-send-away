# app/controllers/api/v1/posts_controller.rb
class Api::V1::LaboratoriesController < Api::V1::BaseController
  def index
    laboratories = Laboratory.all
    render json: serialize_models(laboratories)
  end

  def show
    laboratory = Laboratory.find(params[:id])
    render json: serialize_model(laboratory)
  end

  def out_of_date
    laboratories = Laboratory.out_of_date(params[:months].to_i)
    render json: serialize_models(laboratories)
  end

  def workload
    workload = Laboratory.workload
    render json: workload
  end

  def update
    laboratory = Laboratory.find(params["id"])
    laboratory.attributes = laboratory_params
    if laboratory.save!
      render json: serialize_model(laboratory), status: ok
    else
      render json: serialize_model(laboratory), status: 500
    end

  end

  def laboratory_params
    params.permit(:laboratory_name, :address1, :address2, :address3, :postcode, :city,
                  :telephone, :email, :website, :contact_name, :cpa_status, :cpa_reference_number,
                  :date_information_updated, :date_request_for_information_sent)
  end
end
