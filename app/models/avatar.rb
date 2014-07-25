class Avatar < ActiveRecord::Base
  belongs_to :experiment
  has_one :avatar_image, :as => :imageable

  def uploaded_file=(file)
    self.avatar_image.delete if self.avatar_image
    self.create_avatar_image(:content_type => file.content_type, :data => file.read)
  end
end
