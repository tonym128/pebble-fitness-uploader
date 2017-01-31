require "rails_helper"

RSpec.describe HealthRecordsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/health_records").to route_to("health_records#index")
    end

    it "routes to #new" do
      expect(:get => "/health_records/new").to route_to("health_records#new")
    end

    it "routes to #show" do
      expect(:get => "/health_records/1").to route_to("health_records#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/health_records/1/edit").to route_to("health_records#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/health_records").to route_to("health_records#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/health_records/1").to route_to("health_records#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/health_records/1").to route_to("health_records#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/health_records/1").to route_to("health_records#destroy", :id => "1")
    end

  end
end
