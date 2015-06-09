class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :content
      t.integer :level_id
      t.timestamp

      t.index :level_id
    end
  end
end