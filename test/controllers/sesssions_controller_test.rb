require 'test_helper'

class SesssionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get sesssions_new_url
    assert_response :success
  end

  test "should get create" do
    get sesssions_create_url
    assert_response :success
  end

  test "should get login" do
    get sesssions_login_url
    assert_response :success
  end

  test "should get welcome" do
    get sesssions_welcome_url
    assert_response :success
  end

end
