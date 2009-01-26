require 'test_helper'

class Admin::UsersControllerTest < ActionController::TestCase

  test "inherits from Admin::Base" do # this ensures :admin_required
    assert Admin::UsersController < Admin::Base, "controller should inherit from Admin::Base"
  end

end
