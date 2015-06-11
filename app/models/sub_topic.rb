class SubTopic < ActiveRecord::Base

  belongs_to :topic
  has_and_belongs_to_many :questions

  validates :topic_id,  presence: true  
  validates :name,      presence: true, uniqueness: true

end