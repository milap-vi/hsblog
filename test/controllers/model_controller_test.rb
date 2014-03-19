require 'test_helper'

class ModelControllerTest < ActionController::TestCase
  test "should get Admin" do
    get :Admin
    assert_response :success
  end

  test "should get username:string" do
    get :username:string
    assert_response :success
  end

  test "should get password:string" do
    get :password:string
    assert_response :success
  end

end
