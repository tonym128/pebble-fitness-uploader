# app/controllers/api/v1/users_controller.rb

module Api::V1
  class HealthRecords < ApiController

    # GET /v1/users
    def index
      render json: HealthRecord.all
    end

  end
end