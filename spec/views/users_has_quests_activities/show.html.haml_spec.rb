require 'rails_helper'

RSpec.describe "users_has_quests_activities/show", type: :view do
  before(:each) do
    @users_has_quests_activity = assign(:users_has_quests_activity, UsersHasQuestsActivity.create!(
      :quests_activities_id => 1,
      :users_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
