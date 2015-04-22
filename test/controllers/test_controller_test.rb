require 'test_helper'

class TestControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  test "should get index" do
    sign_in User.first
    get :index
    assert_response :success
  end

end
