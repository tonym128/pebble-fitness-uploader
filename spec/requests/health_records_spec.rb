require 'rails_helper'

RSpec.describe "HealthRecords", type: :request do
  describe "GET /health_records" do
    it "works! (now write some real specs)" do
      get health_records_path
      expect(response).to have_http_status(200)
    end
  end
end
