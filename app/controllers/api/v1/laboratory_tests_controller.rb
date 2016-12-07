# app/controllers/api/v1/posts_controller.rb
class Api::V1::LaboratoryTestsController < Api::V1::BaseController
  def index
    tests = LaboratoryTest.all
    render json: serialize_models(tests)
  end

  def show
    test = LaboratoryTest.find(params[:id])
    render json: serialize_model(test)
  end

  def investigations_offered
  	tests = LaboratoryTest.where(laboratory_id: params[:laboratory_id])
  	render json: serialize_models(tests)
  end
end
