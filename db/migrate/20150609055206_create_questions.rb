class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :content
      t.integer :level_id
      t.timestamps

      t.index :level_id
    end
  end
end