require "test_helper"

class UpcomingFixturesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @competition = competitions(:one)
    @bob = users(:bob)
    @competition.fixtures.each do |fixture|
      fixture.update(date: Time.zone.today)
    end
  end

  test "should get show" do
    sign_in @bob
    get competition_upcoming_fixtures_path(@competition)
    assert_response :success
  end
end
