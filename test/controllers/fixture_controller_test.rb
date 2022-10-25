require "test_helper"

class FixtureControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @bob = users(:bob)
    @competition = competitions(:one)
    @fixture = fixtures(:one)
  end

  test "should get edit of fixture" do
    sign_in @bob
    get edit_competition_fixture_path(@competition, @fixture)
    assert_response :success
    assert_select "input[type=date]", true
    assert_select "select", 2
  end

  test "should get edit of score" do
    sign_in @bob
    get edit_competition_fixture_path(@competition, @fixture, params: {edit_score: true})
    assert_response :success
    assert_select "input[type=date]", false
    assert_select "select", 0
    assert_select "input[type=number]", 2    
  end  


  test "should not get edit of fixture" do
    get edit_competition_fixture_path(@competition, @fixture)
    assert_redirected_to new_user_session_path
  end 

  test "should update fixture" do
    sign_in @bob
    patch competition_fixture_path(@competition, @fixture, format: :turbo_stream), params: { fixture: { home_score: 1, away_score: 0 } }
    assert_response :success
  end

  test "should not update fixture" do
    sign_in @bob
    patch competition_fixture_path(@competition, @fixture, format: :turbo_stream), params: { fixture: { home_team_id: nil, away_score: 0 } }
    assert_response :success
    @fixture.reload
    assert_not_equal nil, @fixture.home_team_id
  end

  test "should create fixture" do
    sign_in @bob
    assert_difference("Fixture.count", +1) do
      post competition_fixtures_path(@competition, format: :turbo_stream), params: { fixture: { home_team_id: teams(:scotland).id, away_team_id: teams(:england).id, date: Date.today } }
    end
    assert_response :success
  end

  test "should not create fixture" do
    sign_in @bob
    assert_no_difference("Fixture.count") do
      post competition_fixtures_path(@competition, format: :turbo_stream), params: { fixture: { home_team_id: nil, away_team_id: teams(:england).id, date: Date.today } }
    end
    assert_response :success
  end

  test "should get index" do
    sign_in @bob
    get competition_fixtures_path(@competition)
    assert_response :success
    fixtures = assigns(:fixtures)
    assert_equal 1, fixtures.count
  end

  test "should not get index" do
    get competition_fixtures_path(@competition)
    assert_redirected_to new_user_session_path
  end
end
