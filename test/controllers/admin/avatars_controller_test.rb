require 'test_helper'

class Admin::AvatarsControllerTest < ActionController::TestCase
  def setup
    sign_in admins(:nate)
  end

  test "create requires login" do
    sign_out admins(:nate)
    post :create, :experiment_id => experiments(:emo), :avatar => {:name => "foo"}
    assert_redirected_to new_admin_session_path
  end

  test "create works" do
    af = fixture_file_upload('1x1.gif', 'image/gif')
    post :create, :experiment_id => experiments(:emo),
      :avatar => {:name => "foo", :uploaded_file => af}
    assert_redirected_to edit_admin_experiment_path(assigns(:experiment))
  end
end
