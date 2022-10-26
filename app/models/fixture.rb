class Fixture < ApplicationRecord
  belongs_to :home_team, class_name: "Team"
  belongs_to :away_team, class_name: "Team"
  belongs_to :competition
  has_many :predictions, dependent: :destroy

  after_commit :create_predictions, on: [:create]
  after_commit :update_predictions, on: [:update]

  validates :date, presence: true

  private

  def create_predictions
    competition.competition_entries.each do |competition_entry|
      prediction = competition_entry.predictions.build(fixture: self)
      prediction.save
    end
  end

  def update_predictions
    return unless home_score.present? && away_score.present?

    predictions.each do |prediction|
      prediction.update_points
    end
  end
end
