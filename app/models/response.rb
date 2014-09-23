class Response < ActiveRecord::Base
  belongs_to :participant
  belongs_to :prompt

  validates :prompt, :presence => true, :uniqueness => {:scope => :participant}
  validates :particpant, :presence => true
end
