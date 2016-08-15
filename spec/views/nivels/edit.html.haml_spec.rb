require 'rails_helper'

RSpec.describe "nivels/edit", type: :view do
  before(:each) do
    @nivel = assign(:nivel, Nivel.create!(
      :nome_nivel => "MyString",
      :qtd_pontos => 1
    ))
  end

  it "renders the edit nivel form" do
    render

    assert_select "form[action=?][method=?]", nivel_path(@nivel), "post" do

      assert_select "input#nivel_nome_nivel[name=?]", "nivel[nome_nivel]"

      assert_select "input#nivel_qtd_pontos[name=?]", "nivel[qtd_pontos]"
    end
  end
end
