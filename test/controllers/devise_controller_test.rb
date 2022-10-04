require "test_helper"

class DeviseControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @bob = users(:bob)
  end

  test "should create user" do
    get new_user_registration_path
    assert_difference('User.count',+1) do
      post user_registration_path({params: {user: {email: "test@example.com", password: "password", password_confirmation: "password", name: "Jessica Houston"}}})
    end
    assert_redirected_to root_path  
    user = User.find_by(email: "test@example.com")
    assert_equal "Jessica", user.first_name 
    assert_equal "Houston", user.last_name
  end
end
