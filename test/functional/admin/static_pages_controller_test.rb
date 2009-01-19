require 'test_helper'

class Admin::StaticPagesControllerTest < ActionController::TestCase

  test "should not work if not an admin user" do
    non_admin = users(:aaron)
    assert_equal false, non_admin.admin?

    login_as(:aaron)
    get :index
    assert_response :redirect
    assert_redirected_to new_session_path
  end

  test "should not work if no user logged in" do
    login_as(nil)
    get :index
    assert_response :redirect
    assert_redirected_to new_session_path
  end

  def setup
    admin_user = users(:quentin)
    assert_equal true, admin_user.admin?

    login_as(:quentin)
  end
  
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:static_pages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create static_page with an appropriate short_name" do
    assert_difference('StaticPage.count') do
      post :create, :static_page => { :title => "Let's see how this works" }
    end

    record = StaticPage.find(:first, :order => "id DESC")
    assert_equal "Let's see how this works", record.title
    assert_equal "Let-S-See-How-This-Works", record.short_name

    assert_redirected_to admin_static_page_path(assigns(:static_page))
  end

  test "should show static_page" do
    get :show, :id => static_pages(:why).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => static_pages(:why).id
    assert_response :success
  end

  test "should update static_page and abide by a provided short name" do
    record = static_pages(:why)
    
    put :update, :id => record.id, :static_page => { :title => "Turkish baths (are good?)" , :short_name => "this-is-the-name-i-want"}
    assert_redirected_to admin_static_page_path(assigns(:static_page))

    record.reload
    assert_equal "Turkish baths (are good?)", record.title
    assert_equal "this-is-the-name-i-want",   record.short_name
  end

  test "should destroy static_page" do
    assert_difference('StaticPage.count', -1) do
      delete :destroy, :id => static_pages(:why).id
    end

    assert_redirected_to admin_static_pages_path
  end

  test "should use wysiwyg" do
    get :new
    assert_select("textarea.wysiwyg[name='static_page[body]']")
  end
end
