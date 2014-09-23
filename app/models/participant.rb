class Participant < ActiveRecord::Base
  belongs_to :experiment
  has_many :responses
  belongs_to :avatar
end
