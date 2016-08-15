require 'rails_helper'

RSpec.describe "quests_activities/show", type: :view do
  before(:each) do
    @quests_activity = assign(:quests_activity, QuestsActivity.create!(
      :descricao_tarefa => "MyText",
      :quests_id => 1,
      :qtd_pontos => 2,
      :parent_activity => "Parent Activity",
      :target_type => "Target Type",
      :action => 3,
      :label => "Label"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Parent Activity/)
    expect(rendered).to match(/Target Type/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Label/)
  end
end
