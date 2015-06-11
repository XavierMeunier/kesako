class Level < ActiveRecord::Base

  has_many :questions
  validates :name,        uniqueness: true, presence: true
  validates :difficulty,  uniqueness: true, presence: true

  before_save do
    self.name.capitalize    
  end

end