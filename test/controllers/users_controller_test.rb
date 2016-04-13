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

  test "should get user with an id" do
    get :show, { id: @user.id }
    assert_response :success
    assert assigns(:user)
  end

  test "should get the show view for a user" do
    get :show, { id: @user.id }
    assert_select "title", "#{@user.name} | #{base_title}"
  end

  test "should post a new user" do
    assert_difference('User.count') do
      post :create, user: {
        name: 'name',
        email: 'name@user.example.com',
        password: 'password',
        password_confirmation:'password'
      }
    end
    assert_redirected_to user_path(assigns(:user))
  end

end
