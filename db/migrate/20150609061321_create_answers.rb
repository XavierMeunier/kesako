class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :content
      t.integer :question_id
      t.timestamps

      t.index :question_id
    end
  end
end
