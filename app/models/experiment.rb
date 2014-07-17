class Experiment < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true
end
