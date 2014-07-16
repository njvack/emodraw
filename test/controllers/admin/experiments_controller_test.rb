require 'test_helper'

class Admin::ExperimentsControllerTest < ActionController::TestCase
  def setup
    sign_in admins(:nate)
  end

  test "index requires login" do
    sign_out admins(:nate)
    get :index
    assert_redirected_to new_admin_session_path
  end

  test "index works" do
    get :index
    assert_response :success
  end
end
