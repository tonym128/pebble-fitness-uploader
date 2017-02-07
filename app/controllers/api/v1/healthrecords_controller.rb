# app/controllers/api/v1/users_controller.rb

module Api::V1
  class HealthRecords < ApiController
    before_action :authenticate

    # GET /v1/healthrecords
    def index
      render json: HealthRecord.where(user: @current_user)
    end

  end
end