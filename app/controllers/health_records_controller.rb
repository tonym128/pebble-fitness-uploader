class HealthRecordsController < ApplicationController
  before_action :set_health_record, only: [:show, :update, :destroy]

  # GET /health_records
  def index
    @health_records = HealthRecord.all

    render json: @health_records
  end

  # GET /health_records/1
  def show
    render json: @health_record
  end

  # POST /health_records
  def create
    @health_record = HealthRecord.new(health_record_params)

    if @health_record.save
      render json: @health_record, status: :created, location: @health_record
    else
      render json: @health_record.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /health_records/1
  def update
    if @health_record.update(health_record_params)
      render json: @health_record
    else
      render json: @health_record.errors, status: :unprocessable_entity
    end
  end

  # DELETE /health_records/1
  def destroy
    @health_record.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_health_record
      @health_record = HealthRecord.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def health_record_params
      params.fetch(:health_record, {})
    end
end