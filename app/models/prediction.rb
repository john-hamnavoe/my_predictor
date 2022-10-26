class Prediction < ApplicationRecord
  belongs_to :competition_entry
  belongs_to :fixture

  def update_points
    return unless home_score.present? && away_score.present?

    prediction_points = home_prediction_points + away_prediction_points + result_prediction_points
    prediction_points = 4 if prediction_points == 3 # bonus point for correct result
    correct = prediction_points == 4
    update(points: prediction_points, correct: correct, goal_difference: goals_difference)

    competition_entry.update_points
  end

  private

  def home_prediction_points 
    fixture.home_score == home_score ? 1 : 0
  end

  def away_prediction_points
    fixture.away_score == away_score ? 1 : 0
  end

  def result_prediction_points
    result(fixture.home_score, fixture.away_score) == result(home_score, away_score)  ? 1 : 0
  end

  def goals_difference
    ((home_score + away_score) - (fixture.home_score + fixture.away_score)).abs
  end

  def result(home_score, away_score)
    if home_score < away_score
      :away_win
    elsif home_score > away_score
      :home_wins
    else
      :draw
    end
  end
end
