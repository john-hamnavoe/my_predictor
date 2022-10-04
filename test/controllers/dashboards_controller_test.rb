require "test_helper"

class DashboardsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @bob = users(:bob)
  end

  test "should get index" do
    sign_in @bob
    get dashboards_path
    assert_response :success
  end

  test "should not get index if not logged in" do
    get dashboards_path
    assert_redirected_to new_user_session_path
  end
end
