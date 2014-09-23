class Experiment < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true

  has_many :avatars
  has_many :participants
  has_many :prompts
end
