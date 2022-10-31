require "test_helper"

class LatestHeadlinesControllerTest < ActionDispatch::IntegrationTest

  setup do
    @competition = competitions(:one)
  end

  test "should get show" do
    get competition_latest_headlines_path(@competition)
    assert_response :success
  end
end
