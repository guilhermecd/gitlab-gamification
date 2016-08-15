require 'rails_helper'

RSpec.describe "UsersHasQuestsActivities", type: :request do
  describe "GET /users_has_quests_activities" do
    it "works! (now write some real specs)" do
      get users_has_quests_activities_path
      expect(response).to have_http_status(200)
    end
  end
end
