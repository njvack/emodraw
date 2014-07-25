require 'test_helper'

class AvatarTest < ActiveSupport::TestCase

  def setup
    extend ActionDispatch::TestProcess
  end

  test "Uploading a file creates an Image" do
    af = fixture_file_upload('1x1.gif', 'image/gif')
    assert_difference("AvatarImage.count", 1) do
      experiments(:emo).avatars.create(
        :name => "Test Avatar",
        :uploaded_file => af
      )
    end
  end

  test "Uploading twice doesn't create extra images" do
    af = fixture_file_upload('1x1.gif', 'image/gif')
    av = experiments(:emo).avatars.create(
        :name => "Test Avatar",
        :uploaded_file => af)
    assert_no_difference("AvatarImage.count") do
      av.uploaded_file = fixture_file_upload('1x1.gif', 'image/gif')
    end
  end
end
