require 'rails_helper'

RSpec.describe "users_has_quests_activities/index", type: :view do
  before(:each) do
    assign(:users_has_quests_activities, [
      UsersHasQuestsActivity.create!(
        :quests_activities_id => 1,
        :users_id => 2
      ),
      UsersHasQuestsActivity.create!(
        :quests_activities_id => 1,
        :users_id => 2
      )
    ])
  end

  it "renders a list of users_has_quests_activities" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
