class CreateQuests < ActiveRecord::Migration
  def change
    create_table :quests do |t|
      t.string :nome_quest
      t.integer :nivels_id, null: false
      t.integer :valor_pontos, null: false

      t.timestamps null: false
    end
  end
end
