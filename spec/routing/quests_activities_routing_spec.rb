require "rails_helper"

RSpec.describe QuestsActivitiesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/quests_activities").to route_to("quests_activities#index")
    end

    it "routes to #new" do
      expect(:get => "/quests_activities/new").to route_to("quests_activities#new")
    end

    it "routes to #show" do
      expect(:get => "/quests_activities/1").to route_to("quests_activities#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/quests_activities/1/edit").to route_to("quests_activities#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/quests_activities").to route_to("quests_activities#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/quests_activities/1").to route_to("quests_activities#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/quests_activities/1").to route_to("quests_activities#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/quests_activities/1").to route_to("quests_activities#destroy", :id => "1")
    end

  end
end
