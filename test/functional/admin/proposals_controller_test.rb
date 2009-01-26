require 'test_helper'

class Admin::ProposalsControllerTest < ActionController::TestCase
  
  test "inherits from Admin::Base" do # this ensures :admin_required
    assert Admin::ProposalsController < Admin::Base, "controller should inherit from Admin::Base"
  end

end
