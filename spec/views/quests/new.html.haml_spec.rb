require 'rails_helper'

RSpec.describe "quests/new", type: :view do
  before(:each) do
    assign(:quest, Quest.new(
      :nome_quest => "MyString",
      :nivels_id => 1,
      :valor_pontos => 1
    ))
  end

  it "renders new quest form" do
    render

    assert_select "form[action=?][method=?]", quests_path, "post" do

      assert_select "input#quest_nome_quest[name=?]", "quest[nome_quest]"

      assert_select "input#quest_nivels_id[name=?]", "quest[nivels_id]"

      assert_select "input#quest_valor_pontos[name=?]", "quest[valor_pontos]"
    end
  end
end
