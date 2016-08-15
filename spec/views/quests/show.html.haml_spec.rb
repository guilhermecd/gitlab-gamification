require 'rails_helper'

RSpec.describe "quests/show", type: :view do
  before(:each) do
    @quest = assign(:quest, Quest.create!(
      :nome_quest => "Nome Quest",
      :nivels_id => 1,
      :valor_pontos => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nome Quest/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
