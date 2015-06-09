class Question < ActiveRecord::Base

  belongs_to :level
  has_many :answers
  has_and_belongs_to_many :sub_topics

end