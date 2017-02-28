module Api::V1
  class UsersController < ApiController
    before_action :authenticate, except: [:create]
    before_action :set_user, only: [:show, :update, :destroy]

    # GET /users
    def index
      render json: @current_user
    end

    # GET /users/1
    def show
      render json: @user
    end

    # POST /users
    def create
      @user = User.find_by_email(user_params[:email])
      if @user != nil
        if @user.password == user_params[:password]
          render json: @user, status: :created
        elsif render json: 'Bad credentials', status: :unauthorized
        end
      else
        @user = User.new(user_params)
        if @user.save
          render json: @user, status: :created
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end
    end

    # PATCH/PUT /users/1
    def update
      if @user.update(user_params)
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    # DELETE /users/1
    def destroy
      @user.destroy
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])

      if @user.id != @current_user.id
        @user = {}
      end
    rescue ActiveRecord::RecordNotFound => exception
      @user = {}
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
  end
end
