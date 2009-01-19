require 'test_helper'

class Admin::StaticPagesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:static_pages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create static_page" do
    assert_difference('StaticPage.count') do
      post :create, :static_page => { }
    end

    assert_redirected_to admin_static_page_path(assigns(:static_page))
  end

  test "should show static_page" do
    get :show, :id => static_pages(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => static_pages(:one).id
    assert_response :success
  end

  test "should update static_page" do
    put :update, :id => static_pages(:one).id, :static_page => { }
    assert_redirected_to admin_static_page_path(assigns(:static_page))
  end

  test "should destroy static_page" do
    assert_difference('StaticPage.count', -1) do
      delete :destroy, :id => static_pages(:one).id
    end

    assert_redirected_to admin_static_pages_path
  end
end
