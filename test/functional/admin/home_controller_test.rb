require 'test_helper'

class Admin::HomeControllerTest < ActionController::TestCase

  test "inherits from Admin::Base" do # this ensures :admin_required
    assert Admin::HomeController < Admin::Base, "controller should inherit from Admin::Base"
  end

  test "index should work for a logged in admin" do
    login_as(:quentin)
    get :index
    assert_response :success
  end

  test "index should not work for a non admin" do
    login_as(:aaron)
    get :index
    assert_response :redirect
    assert_redirected_to new_session_path
  end
end
