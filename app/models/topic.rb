class Topic < ActiveRecord::Base

  has_many :sub_topics

  validates :name, uniqueness: true, presence: true

end