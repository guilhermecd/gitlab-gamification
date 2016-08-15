require "rails_helper"

RSpec.describe UsersHasQuestsActivitiesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/users_has_quests_activities").to route_to("users_has_quests_activities#index")
    end

    it "routes to #new" do
      expect(:get => "/users_has_quests_activities/new").to route_to("users_has_quests_activities#new")
    end

    it "routes to #show" do
      expect(:get => "/users_has_quests_activities/1").to route_to("users_has_quests_activities#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/users_has_quests_activities/1/edit").to route_to("users_has_quests_activities#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/users_has_quests_activities").to route_to("users_has_quests_activities#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/users_has_quests_activities/1").to route_to("users_has_quests_activities#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/users_has_quests_activities/1").to route_to("users_has_quests_activities#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/users_has_quests_activities/1").to route_to("users_has_quests_activities#destroy", :id => "1")
    end

  end
end
