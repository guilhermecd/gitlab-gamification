require 'rails_helper'

RSpec.describe "users_has_quests_activities/edit", type: :view do
  before(:each) do
    @users_has_quests_activity = assign(:users_has_quests_activity, UsersHasQuestsActivity.create!(
      :quests_activities_id => 1,
      :users_id => 1
    ))
  end

  it "renders the edit users_has_quests_activity form" do
    render

    assert_select "form[action=?][method=?]", users_has_quests_activity_path(@users_has_quests_activity), "post" do

      assert_select "input#users_has_quests_activity_quests_activities_id[name=?]", "users_has_quests_activity[quests_activities_id]"

      assert_select "input#users_has_quests_activity_users_id[name=?]", "users_has_quests_activity[users_id]"
    end
  end
end
