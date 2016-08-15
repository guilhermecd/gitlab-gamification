require 'rails_helper'

RSpec.describe "quests_activities/new", type: :view do
  before(:each) do
    assign(:quests_activity, QuestsActivity.new(
      :descricao_tarefa => "MyText",
      :quests_id => 1,
      :qtd_pontos => 1,
      :parent_activity => "MyString",
      :target_type => "MyString",
      :action => 1,
      :label => "MyString"
    ))
  end

  it "renders new quests_activity form" do
    render

    assert_select "form[action=?][method=?]", quests_activities_path, "post" do

      assert_select "textarea#quests_activity_descricao_tarefa[name=?]", "quests_activity[descricao_tarefa]"

      assert_select "input#quests_activity_quests_id[name=?]", "quests_activity[quests_id]"

      assert_select "input#quests_activity_qtd_pontos[name=?]", "quests_activity[qtd_pontos]"

      assert_select "input#quests_activity_parent_activity[name=?]", "quests_activity[parent_activity]"

      assert_select "input#quests_activity_target_type[name=?]", "quests_activity[target_type]"

      assert_select "input#quests_activity_action[name=?]", "quests_activity[action]"

      assert_select "input#quests_activity_label[name=?]", "quests_activity[label]"
    end
  end
end
