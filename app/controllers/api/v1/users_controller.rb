# app/controllers/api/v1/users_controller.rb

module Api::V1
  class UsersController < ApiController
    before_action :authenticate

    # GET /v1/users
    def index
      render json: @current_user
    end

  end
end