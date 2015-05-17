require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  test "should get news" do
    get :news
    assert_response :success
  end

  test "should get programming" do
    get :programming
    assert_response :success
  end

  test "should get education" do
    get :education
    assert_response :success
  end

  test "should get sports" do
    get :sports
    assert_response :success
  end

  test "should get humor" do
    get :humor
    assert_response :success
  end

end
