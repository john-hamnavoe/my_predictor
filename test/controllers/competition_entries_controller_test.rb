require "test_helper"

class CompetitionEntriesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @bob = users(:bob)
    @competition_entry = competition_entries(:one)
    @prediction = predictions(:one)
  end

  test "should get new" do
    sign_in @bob
    get new_competition_entry_path
    assert_response :success
    available_competitions = assigns(:available_competitions)
    assert_equal 2, available_competitions.count
  end

  test "should not get new if not logged in" do
    get new_competition_entry_path
    assert_redirected_to new_user_session_path
  end

  test "should create competition_entry" do
    sign_in @bob
    assert_difference("CompetitionEntry.count", +1) do
      assert_difference("Prediction.count", +2) do
        post competition_entries_path, params: { competition_entry: { competition_id: competitions(:five).id } }
      end
    end
    assert_redirected_to edit_competition_entry_path(CompetitionEntry.last)
  end

  test "should not create competition_entry if not logged in" do
    assert_no_difference("CompetitionEntry.count") do
      assert_no_difference("Prediction.count") do      
        post competition_entries_path, params: { competition_entry: { competition_id: competitions(:five).id } }
      end
    end
    assert_redirected_to new_user_session_path
  end

  test "should not create competition_entry if already entered" do
    sign_in @bob
    assert_no_difference("CompetitionEntry.count") do
      assert_no_difference("Prediction.count") do      
        post competition_entries_path, params: { competition_entry: { competition_id: competitions(:one).id } }
      end
    end
    assert_template :new
  end

  test "should not create competition_entry if invalid" do
    sign_in @bob
    assert_no_difference("CompetitionEntry.count") do
      assert_no_difference("Prediction.count") do      
        post competition_entries_path, params: { competition_entry: { competition_id: nil } }
      end
    end
    assert_template :new
  end

  test "should get edit" do
    sign_in @bob
    get edit_competition_entry_path(@competition_entry)
    assert_response :success
  end

  test "should update entry" do
    sign_in @bob
    patch competition_entry_path(@competition_entry), params: { competition_entry: { predictions_attributes: [{id: @prediction.id, home_score: 3, away_score: 2 }] } }
    assert_redirected_to dashboards_path
    @prediction.reload
    assert_equal 3, @prediction.home_score
    assert_equal 2, @prediction.away_score
  end

  test "should not update entry" do
    sign_in @bob
    patch competition_entry_path(@competition_entry), params: { competition_entry: {user_id: nil, predictions_attributes: [{id: @prediction.id, home_score: 3, away_score: 2 }] } }
    assert_template :edit
    @prediction.reload
    assert_equal 1, @prediction.home_score
    assert_equal 1, @prediction.away_score
  end
end
