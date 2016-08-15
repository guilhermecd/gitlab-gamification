class CreateUsersHasQuestsActivities < ActiveRecord::Migration
  def change
    create_table :users_has_quests_activities do |t|
      t.integer :quests_activities_id, null: false
      t.integer :users_id, null: false

      t.timestamps null: false
    end
  end
end
