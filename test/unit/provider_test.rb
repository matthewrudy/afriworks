require 'test_helper'

class ProviderTest < ActiveSupport::TestCase

  test "bump! forces updated_at to increment" do
    freeze_time!
    provider = providers(:newbamboo)
    provider.bump!

    assert_equal Time.now, provider.updated_at

    time_up!(1.day)
    assert_equal 1.day.ago, provider.updated_at

    provider.bump!
    assert_equal Time.now, provider.updated_at
  end
end
