require 'test_helper'

class StaticPageTest < ActiveSupport::TestCase

  test ":published scope conditions on :published => true" do
    assert_equal StaticPage.find_all_by_published(true), StaticPage.published.all

    # add a new record
    new_record = StaticPage.published.new
    assert_equal true, new_record.published?
  end

  test "default order is position" do
    all = StaticPage.all
    assert_equal all.sort_by(&:position), all
  end

  test "default order is used for named_scope also" do
    published = StaticPage.published.all
    assert_equal published.sort_by(&:position), published
  end
end
