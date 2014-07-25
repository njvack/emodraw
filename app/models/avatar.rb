class Avatar < ActiveRecord::Base
  belongs_to :experiment
  has_one :avatar_image, :as => :imageable
  attr_writer :uploaded_file

  after_save :save_image_file!

  def save_image_file!
    self.avatar_image.delete if self.avatar_image
    self.create_avatar_image(:content_type => @uploaded_file.content_type, :data => @uploaded_file.read)
  end
end
