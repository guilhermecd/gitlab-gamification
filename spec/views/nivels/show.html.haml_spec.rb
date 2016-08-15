require 'rails_helper'

RSpec.describe "nivels/show", type: :view do
  before(:each) do
    @nivel = assign(:nivel, Nivel.create!(
      :nome_nivel => "Nome Nivel",
      :qtd_pontos => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nome Nivel/)
    expect(rendered).to match(/1/)
  end
end
