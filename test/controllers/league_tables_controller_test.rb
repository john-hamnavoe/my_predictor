require "test_helper"

class LeagueTablesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @competition = competitions(:one)
    @bob = users(:bob)
  end

  test "should get show" do
    sign_in @bob
    get competition_league_table_path(@competition)
    assert_response :success
  end
end
