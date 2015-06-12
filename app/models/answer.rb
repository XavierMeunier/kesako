class Answer < ActiveRecord::Base

  belongs_to :question

  validates :content, presence: true
  validates :question_id, presence: true

  # Set correct if match another good answer
  after_save(on: :create) do 
    self.update_column :correct, self.correct?
  end

  def correct?
    self.question.good_answers.include? self.content.downcase
  end

end