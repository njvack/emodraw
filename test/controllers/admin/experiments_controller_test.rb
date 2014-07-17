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

  test "index renders" do
    get :index
    assert_response :success
    assert assigns(:experiments).count > 0
  end

  test "new renders" do
    get :new
    assert_response :success
  end

  test "edit renders" do
    get :edit, :id => experiments(:emo)
    assert_response :success
  end

  test "creating experiments works" do
    assert_difference("Experiment.count", 1) do
      post :create, {:experiment => {:name => "newexp"}}
      assert_redirected_to edit_admin_experiment_path(assigns(:experiment))
    end
  end

  test "updating experiment works" do
    exp = experiments(:emo)
    post :update, {:id => exp, :experiment => { :name => "Emofix"}}
    assert_redirected_to edit_admin_experiment_path(assigns(:experiment))
    assert assigns(:experiment).name == 'Emofix'
  end
end
