class CreateNivels < ActiveRecord::Migration
  def change
    create_table :nivels do |t|
      t.string :nome_nivel
      t.integer :qtd_pontos

      t.timestamps null: false
    end
  end
end
