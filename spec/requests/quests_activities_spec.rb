require 'rails_helper'

RSpec.describe "QuestsActivities", type: :request do
  describe "GET /quests_activities" do
    it "works! (now write some real specs)" do
      get quests_activities_path
      expect(response).to have_http_status(200)
    end
  end
end
