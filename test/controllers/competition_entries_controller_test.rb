require "test_helper"

class CompetitionEntriesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @bob = users(:bob)
    @competition_entry = competition_entries(:one)
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
      post competition_entries_path, params: { competition_entry: { competition_id: competitions(:five).id } }
    end
    assert_redirected_to root_path
  end

  test "should not create competition_entry if not logged in" do
    assert_no_difference("CompetitionEntry.count") do
      post competition_entries_path, params: { competition_entry: { competition_id: competitions(:five).id } }
    end
    assert_redirected_to new_user_session_path
  end

  test "should not create competition_entry if already entered" do
    sign_in @bob
    assert_no_difference("CompetitionEntry.count") do
      post competition_entries_path, params: { competition_entry: { competition_id: competitions(:one).id } }
    end
    assert_template :new
  end

  test "should not create competition_entry if invalid" do
    sign_in @bob
    assert_no_difference("CompetitionEntry.count") do
      post competition_entries_path, params: { competition_entry: { competition_id: nil } }
    end
    assert_template :new
  end


  # test "should get edit" do
  #   get competition_entries_edit_url
  #   assert_response :success
  # end

  # test "should get update" do
  #   get competition_entries_update_url
  #   assert_response :success
  # end

  # test "should get create" do
  #   get competition_entries_create_url
  #   assert_response :success
  # end
end
