require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @bob = users(:bob)
  end

  test "should get index" do
    get root_path
    assert_response :success
  end

  test "should get redirected to dashboards if logged in" do
    sign_in @bob
    get root_path
    assert_redirected_to dashboards_path
  end 
end
