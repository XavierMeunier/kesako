class CreateSubTopics < ActiveRecord::Migration
  def change
    create_table :sub_topics do |t|
      t.string :name
      t.integer :topic_id
      t.timestamps

      t.index :topic_id
    end
  end
end
