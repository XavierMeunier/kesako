class Question < ActiveRecord::Base

  belongs_to :level
  has_many :answers, :dependent => :destroy
  has_and_belongs_to_many :sub_topics

  accepts_nested_attributes_for :answers, :reject_if => lambda { |answer| answer[:content].blank? }, :allow_destroy => true

  def good_answers
    gas = self.answers.find_all{ |a| a.correct }.map{|a| a.content}
    gas.blank? ? ["42"] : gas
  end

end