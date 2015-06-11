class Question < ActiveRecord::Base

  belongs_to :level
  has_many :answers, :dependent => :destroy
  has_and_belongs_to_many :sub_topics

  validates :level_id, presence: true
  accepts_nested_attributes_for :answers, :reject_if => lambda { |answer| answer[:content].blank? }, :allow_destroy => true

  def good_answers
    gas = self.answers.find_all{ |a| a.correct }.map{|a| a.content}
    # 42 is the answer to everything is there is no rational answer
    gas.blank? ? ["42"] : gas
  end

end