class Image < ActiveRecord::Base
  belongs_to :imageable, :polymorphic => true

  before_save :set_dimensions, :if => :has_data?

  def set_dimensions
    img = MiniMagick::Image.read(self.data)
    self.height = img[:height]
    self.width = img[:width]
  end

  def has_data?
    self.data.present?
  end
end
