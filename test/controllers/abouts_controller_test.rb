require "test_helper"

class AboutsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get abouts_path
    assert_response :success
  end
end
