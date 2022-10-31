require "test_helper"

class NewsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @bob = users(:bob)
    @news = news(:one)
  end

  test "should get index" do
    get news_index_path
    assert_response :success
  end

  test "should get new" do
    sign_in @bob
    get new_news_path
    assert_response :success
  end

  test "should create news" do
    sign_in @bob
    assert_difference("News.count") do
      post news_index_path, params: { news: { competition_id: @news.competition_id, date: @news.date, headline: @news.headline } }
    end

    assert_redirected_to news_index_path
  end

  test "should not create news if inavlid" do
    sign_in @bob
    assert_no_difference("News.count") do
      post news_index_path, params: { news: { competition_id: @news.competition_id, date: @news.date, headline: "" } }
    end
    assert_template :new
  end

  test "should show news" do
    get news_path(@news)
    assert_response :success
  end

  test "should get edit" do
    sign_in @bob
    get edit_news_path(@news)
    assert_response :success
  end

  test "should update news" do
    sign_in @bob
    patch news_path(@news), params: { news: { competition_id: @news.competition_id, date: @news.date, headline: @news.headline } }
    assert_redirected_to news_index_path
  end

  test "should not update news if invalid" do
    sign_in @bob
    patch news_path(@news), params: { news: { competition_id: @news.competition_id, date: @news.date, headline: "" } }
    assert_response :unprocessable_entity
    assert_template :edit 
  end

  test "should destroy news" do
    sign_in @bob
    assert_difference("News.count", -1) do
      delete news_url(@news)
    end

    assert_redirected_to news_index_path
  end
end
