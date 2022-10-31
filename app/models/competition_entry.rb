class CompetitionEntry < ApplicationRecord
  belongs_to :competition
  belongs_to :user
  belongs_to :winner, class_name: "Team", optional: true
  belongs_to :runner_up, class_name: "Team", optional: true
  has_many :predictions, -> { eager_load(:fixture).eager_load(fixture: [:home_team, :away_team]).order("fixtures.date asc") }, dependent: :destroy

  after_commit :create_predictions, on: [:create]

  validates :competition, uniqueness: { scope: :user }

  accepts_nested_attributes_for :predictions

  def update_points
    update(points: predictions.sum(:points), correct_scores: predictions.where(correct: true).count, goal_difference: predictions.sum(:goal_difference))
  end

  def incomplete_predictions_count
    predictions.where("fixtures.locked = false").where("predictions.home_score is null or predictions.away_score is null").count
  end

  private

  def create_predictions
    competition.fixtures.each do |fixture|
      prediction = predictions.build(fixture: fixture)
      prediction.save
    end
  end
end
