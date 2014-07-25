require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  def setup
    extend ActionDispatch::TestProcess
  end

  test "saving sets height and width" do
    af = fixture_file_upload('1x1.gif', 'image/gif')
    img = Image.create(
      :type => 'Image',
      :imageable_type => 'TestImageable',
      :imageable_id => 0,
      :content_type => af.content_type,
      :data => af.read()
    )
    assert_equal img.height, 1
    assert_equal img.width, 1
  end
end
