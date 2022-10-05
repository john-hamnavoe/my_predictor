require "test_helper"

class TeamsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @bob = users(:bob)
    @sarah = users(:sarah)
    @team = teams(:scotland)
  end

  setup do
    @international_teams = team_categories(:international)
    @domstic_teams = team_categories(:domestic)
  end

  test "should not get index - not logged on" do
    get teams_path
    assert_redirected_to new_user_session_path
  end

  test "should not get index - not admin" do
    sign_in @sarah
    get teams_path
    assert_redirected_to root_path
  end

  test "should get index" do
    sign_in @bob
    get teams_path
    assert :success
    teams = assigns(:teams)
    assert_equal 6, teams.count
  end

  test "should get index - domestic teams" do
    sign_in @bob
    get teams_path(team_category_id: @domstic_teams.id)
    assert :success
    teams = assigns(:teams)
    team_category_id = assigns(:team_category_id)
    team_categories = assigns(:team_categories)
    assert_equal 4, teams.count, "Should be 4 teams"
    assert_equal 2, team_categories.count, "Should be 2 team categories"
    assert_equal @domstic_teams.id, team_category_id.to_i
  end  

  test "should not create team - not signed in" do
    assert_no_difference("Team.count") do
      post teams_path, params: { team: { name: "Netherlands", team_category_id: @international_teams.id } }
    end

    assert_redirected_to new_user_session_path
  end

  test "should create team" do
    sign_in @bob
    assert_difference("Team.count", +1) do
      post teams_path(format: :turbo_stream), params: { team: { name: "Netherlands", team_category_id: @international_teams.id } }
    end

    assert_response :success
  end

  test "should not create team" do
    sign_in @bob
    assert_no_difference("Team.count") do
      post teams_path(format: :turbo_stream), params: { team: { name: nil, team_category_id: @international_teams.id } }
    end
    assert_response :success
  end  

  test "should get edit" do
    sign_in @bob
    get edit_team_url(@team)
    assert_response :success
  end

  test "should update team" do
    sign_in @bob
    patch team_url(@team, format: :turbo_stream), params: { team: { name: @team.name, team_category_id: @team.team_category_id } }
    assert_response :success
  end

  test "should not update team" do
    sign_in @bob
    patch team_url(@team, format: :turbo_stream), params: { team: { name: nil, team_category_id: @team.team_category_id } }
    assert_response :success
    @team.reload
    assert_not_nil @team.name
  end  
end
