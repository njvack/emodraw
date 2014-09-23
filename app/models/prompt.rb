class Prompt < ActiveRecord::Base
  belongs_to :experiment
  has_many :responses
end
