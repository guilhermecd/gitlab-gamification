require 'rails_helper'

RSpec.describe "nivels/new", type: :view do
  before(:each) do
    assign(:nivel, Nivel.new(
      :nome_nivel => "MyString",
      :qtd_pontos => 1
    ))
  end

  it "renders new nivel form" do
    render

    assert_select "form[action=?][method=?]", nivels_path, "post" do

      assert_select "input#nivel_nome_nivel[name=?]", "nivel[nome_nivel]"

      assert_select "input#nivel_qtd_pontos[name=?]", "nivel[qtd_pontos]"
    end
  end
end
