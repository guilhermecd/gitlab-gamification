class CreateQuestsActivities < ActiveRecord::Migration
  def change
    create_table :quests_activities do |t|
      t.text :descricao_tarefa
      t.integer :quests_id
      t.integer :qtd_pontos, null: false
      t.string :parent_activity
      t.string :target_type
      t.integer :action
      t.string :label, null: false

      t.timestamps null: false
    end
  end
end
