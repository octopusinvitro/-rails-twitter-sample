require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  test "should get new" do
    get :new
    assert_response :success
    assert assigns(:user)
  end

  test "should render the signup view" do
    get :new
    assert_select "title", "Sign up | #{base_title}"
  end

end
