class Experiment < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true
  validates :url_slug, :uniqueness => true
  before_validation :generate_url_slug, :on => :create

  has_many :avatars
  has_many :participants
  has_many :prompts

  private
  def generate_url_slug
    digest = Digest::SHA256.new
    digest.update(self.name)
    digest.update(Time.now.to_f.to_s)
    self.url_slug = digest.base64digest[0,8] # 8^64 is enough
  end
end
