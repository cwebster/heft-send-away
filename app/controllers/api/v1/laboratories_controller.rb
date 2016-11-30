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
    byebug
    laboratory = Laboratory.find(params[:json][:id])
    puts params
    render json: serialize_model(laboratory)

  end


end
