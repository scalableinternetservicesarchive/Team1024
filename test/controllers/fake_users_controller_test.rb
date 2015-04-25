require 'test_helper'

class FakeUsersControllerTest < ActionController::TestCase
  setup do
    @fake_user = fake_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fake_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fake_user" do
    assert_difference('FakeUser.count') do
      post :create, fake_user: {  }
    end

    assert_redirected_to fake_user_path(assigns(:fake_user))
  end

  test "should show fake_user" do
    get :show, id: @fake_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fake_user
    assert_response :success
  end

  test "should update fake_user" do
    patch :update, id: @fake_user, fake_user: {  }
    assert_redirected_to fake_user_path(assigns(:fake_user))
  end

  test "should destroy fake_user" do
    assert_difference('FakeUser.count', -1) do
      delete :destroy, id: @fake_user
    end

    assert_redirected_to fake_users_path
  end
end
