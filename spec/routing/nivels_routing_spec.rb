require "rails_helper"

RSpec.describe NivelsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/nivels").to route_to("nivels#index")
    end

    it "routes to #new" do
      expect(:get => "/nivels/new").to route_to("nivels#new")
    end

    it "routes to #show" do
      expect(:get => "/nivels/1").to route_to("nivels#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/nivels/1/edit").to route_to("nivels#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/nivels").to route_to("nivels#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/nivels/1").to route_to("nivels#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/nivels/1").to route_to("nivels#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/nivels/1").to route_to("nivels#destroy", :id => "1")
    end

  end
end
