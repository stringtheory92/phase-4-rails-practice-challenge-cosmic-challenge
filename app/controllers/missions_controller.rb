class MissionsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_errors
wrap_parameters format: []

    def index 
        render json: Mission.all
    end

    def create
        mission = Mission.create!(mission_params)
        render json: mission.planet, status: :created
    end

    private

    def mission_params
        params.permit(:name, :scientist_id, :planet_id)
    end

    def render_errors(invalid)
        
        render json: invalid.record.errors.full_messages, status: :unprocessable_entity
    end
end
