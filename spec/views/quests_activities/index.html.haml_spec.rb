require 'rails_helper'

RSpec.describe "quests_activities/index", type: :view do
  before(:each) do
    assign(:quests_activities, [
      QuestsActivity.create!(
        :descricao_tarefa => "MyText",
        :quests_id => 1,
        :qtd_pontos => 2,
        :parent_activity => "Parent Activity",
        :target_type => "Target Type",
        :action => 3,
        :label => "Label"
      ),
      QuestsActivity.create!(
        :descricao_tarefa => "MyText",
        :quests_id => 1,
        :qtd_pontos => 2,
        :parent_activity => "Parent Activity",
        :target_type => "Target Type",
        :action => 3,
        :label => "Label"
      )
    ])
  end

  it "renders a list of quests_activities" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Parent Activity".to_s, :count => 2
    assert_select "tr>td", :text => "Target Type".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Label".to_s, :count => 2
  end
end
