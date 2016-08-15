require 'rails_helper'

RSpec.describe "quests/index", type: :view do
  before(:each) do
    assign(:quests, [
      Quest.create!(
        :nome_quest => "Nome Quest",
        :nivels_id => 1,
        :valor_pontos => 2
      ),
      Quest.create!(
        :nome_quest => "Nome Quest",
        :nivels_id => 1,
        :valor_pontos => 2
      )
    ])
  end

  it "renders a list of quests" do
    render
    assert_select "tr>td", :text => "Nome Quest".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
