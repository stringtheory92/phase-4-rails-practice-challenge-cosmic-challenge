class ScientistsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_record_response

    def index 
        render json: Scientist.all, status: :ok
    end

    def show
        scientist = Scientist.find(params[:id])
        render json: scientist, serializer: ScientistShowSerializer, status: :ok
    end

    def create
        scientist = Scientist.create!(scientist_params)
        render json: scientist, status: :created
    end

    def update
        scientist = Scientist.find(params[:id])

        scientist.update!(scientist_params)
        render json: scientist, status: :accepted
    end

    def destroy
       
        scientist = Scientist.find(params[:id])
        scientist.destroy!
        head :no_content
    end

    private

    def scientist_params
        params.permit(:name, :field_of_study, :avatar)
    end

    def render_not_found_response
        render json: {error: "scientist not found"}, status: :not_found
    end

    def render_invalid_record_response
        render json: {errors: ["validation errors"]}, status: :unprocessable_entity
    end
end
