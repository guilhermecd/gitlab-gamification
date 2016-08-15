require 'rails_helper'

RSpec.describe "quests/edit", type: :view do
  before(:each) do
    @quest = assign(:quest, Quest.create!(
      :nome_quest => "MyString",
      :nivels_id => 1,
      :valor_pontos => 1
    ))
  end

  it "renders the edit quest form" do
    render

    assert_select "form[action=?][method=?]", quest_path(@quest), "post" do

      assert_select "input#quest_nome_quest[name=?]", "quest[nome_quest]"

      assert_select "input#quest_nivels_id[name=?]", "quest[nivels_id]"

      assert_select "input#quest_valor_pontos[name=?]", "quest[valor_pontos]"
    end
  end
end
