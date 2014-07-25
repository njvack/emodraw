class Avatar < ActiveRecord::Base
  belongs_to :experiment

  def uploaded_file=(file)
  end
end
