ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'test_help'

class ActiveSupport::TestCase

  self.use_transactional_fixtures = true
  self.use_instantiated_fixtures  = false

  fixtures :all

  # Add more helper methods to be used by all tests here...
  def get_fixture_file(name)
    File.open(File.join(Rails.root, "test", "fixtures", "files", name))
  end

  def freeze_time!
    @time_now = Time.now
    Time.stubs(:now).at_least_once.returns(@time_now)
  end
  def time_up!(diff)
    @time_now = Time.now
    Time.stubs(:now).returns(@time_now + diff)
  end
  
  include AuthenticatedTestHelper
end
