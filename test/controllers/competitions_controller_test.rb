require "test_helper"

class CompetitionsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @bob = users(:bob)
    @competition = competitions(:one)
  end

  test "should get index" do
    sign_in @bob
    get competitions_path
    assert_response :success
  end

  test "should not get index" do
    get competitions_path
    assert_redirected_to new_user_session_path
  end  

  test "should get new" do
    sign_in @bob
    get new_competition_path
    assert_response :success
  end

  test "should create competition" do
    sign_in @bob    
    assert_difference("Competition.count") do
      post competitions_url, params: { competition: { active: @competition.active, name: @competition.name, prizes: @competition.prizes, public: @competition.public, scoring_system_id: @competition.scoring_system_id, team_category_id: @competition.team_category_id } }
    end

    assert_redirected_to competitions_path
  end

  test "should not create competition" do
    sign_in @bob
    assert_no_difference("Competition.count") do
      post competitions_url, params: { competition: { active: @competition.active, name: nil, prizes: @competition.prizes, public: @competition.public, scoring_system_id: @competition.scoring_system_id, team_category_id: @competition.team_category_id } }
    end

    assert_template :new
  end

  test "should show competition" do
    sign_in @bob    
    get competition_url(@competition)
    assert_response :success
  end

  test "should get edit" do
    sign_in @bob    
    get edit_competition_url(@competition)
    assert_response :success
  end

  test "should update competition" do
    sign_in @bob    
    patch competition_url(@competition), params: { competition: { active: @competition.active, name: @competition.name, prizes: @competition.prizes, public: @competition.public, scoring_system_id: @competition.scoring_system_id, team_category_id: @competition.team_category_id, user_id: @competition.user_id } }
    assert_redirected_to competitions_path
  end

  test "should not update competition" do
    sign_in @bob    
    patch competition_url(@competition), params: { competition: { active: @competition.active, name: nil, prizes: @competition.prizes, public: @competition.public, scoring_system_id: @competition.scoring_system_id, team_category_id: @competition.team_category_id, user_id: @competition.user_id } }
    assert_template :edit
    @competition.reload
    assert_not_equal nil, @competition.name
  end
end
