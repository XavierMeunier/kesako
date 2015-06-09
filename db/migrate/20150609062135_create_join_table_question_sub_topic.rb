class CreateJoinTableQuestionSubTopic < ActiveRecord::Migration
  def change
    create_join_table :questions, :sub_topics do |t|
      t.index [:sub_topic_id, :question_id]
    end
  end
end
