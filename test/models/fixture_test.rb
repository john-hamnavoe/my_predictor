require "test_helper"

class FixtureTest < ActiveSupport::TestCase

  setup do 
    @fixture = fixtures(:one)
    @prediction = predictions(:one)
    @competition_entry = competition_entries(:one)
  end

  test "should calculate perfect prediction" do
    @fixture.update(home_score: 1, away_score: 1)
    @prediction.reload
    @competition_entry.reload
    assert_equal 4, @prediction.points
    assert @prediction.correct
    assert_equal 0, @prediction.goal_difference
    assert_equal 4, @competition_entry.points
    assert_equal 1, @competition_entry.correct_scores
    assert_equal 0, @competition_entry.goal_difference
  end

  test "should calculate correct result" do
    @fixture.update(home_score: 2, away_score: 2)
    @prediction.reload
    @competition_entry.reload
    assert_equal 1, @prediction.points
    assert_not @prediction.correct
    assert_equal 2, @prediction.goal_difference
    assert_equal 1, @competition_entry.points
    assert_equal 0, @competition_entry.correct_scores
    assert_equal 2, @competition_entry.goal_difference    
  end

  test "should calculate home score" do
    @fixture.update(home_score: 1, away_score: 2)
    @prediction.reload
    @competition_entry.reload
    assert_equal 1, @prediction.points
    assert_not @prediction.correct
    assert_equal 1, @prediction.goal_difference
    assert_equal 1, @competition_entry.points
    assert_equal 0, @competition_entry.correct_scores
    assert_equal 1, @competition_entry.goal_difference       
  end

  test "should calculate away score" do
    @fixture.update(home_score: 5, away_score: 1)
    @prediction.reload
    @competition_entry.reload
    assert_equal 1, @prediction.points
    assert_not @prediction.correct
    assert_equal 4, @prediction.goal_difference
    assert_equal 1, @competition_entry.points
    assert_equal 0, @competition_entry.correct_scores
    assert_equal 4, @competition_entry.goal_difference       
  end
  
  test "should calculate no points" do
    @fixture.update(home_score: 5, away_score: 3)
    @prediction.reload
    @competition_entry.reload
    assert_equal 0, @prediction.points
    assert_not @prediction.correct
    assert_equal 6, @prediction.goal_difference
    assert_equal 0, @competition_entry.points
    assert_equal 0, @competition_entry.correct_scores
    assert_equal 6, @competition_entry.goal_difference       
  end  
end
