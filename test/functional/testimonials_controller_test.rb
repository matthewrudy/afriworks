require 'test_helper'

class TestimonialsControllerTest < ActionController::TestCase
  fixtures :testimonials, :providers

  def test_index_should_list_all_testimonials_for_the_given_provider
    get :index, :provider_id => providers(:one).id
    assert_response :success
    assert_equal providers(:one), assigns(:provider)

    providers(:one).testimonials.each do |testimonial|
      assert_select("blockquote", testimonial.text)
    end
  end

  def test_index_should_work_if_there_are_no_testimonials
    provider = providers(:two)
    assert_equal [], provider.testimonials.all

    get :index, :provider_id => provider.id
    assert_response :success
  end

  def test_index_should_break_if_given_a_bad_provider_id
    assert_raise(ActiveRecord::RecordNotFound) do
      get :index, :provider_id => "should-never-exist"
    end
  end
end
