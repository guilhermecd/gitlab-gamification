require 'rails_helper'

RSpec.describe "nivels/index", type: :view do
  before(:each) do
    assign(:nivels, [
      Nivel.create!(
        :nome_nivel => "Nome Nivel",
        :qtd_pontos => 1
      ),
      Nivel.create!(
        :nome_nivel => "Nome Nivel",
        :qtd_pontos => 1
      )
    ])
  end

  it "renders a list of nivels" do
    render
    assert_select "tr>td", :text => "Nome Nivel".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
