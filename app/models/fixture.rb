class Fixture < ApplicationRecord
  belongs_to :home_team, class_name: "Team"
  belongs_to :away_team, class_name: "Team"
  belongs_to :competition

  after_commit :create_predictions, on: [:create]

  validates :date, presence: true

  private

  def create_predictions
    competition.competition_entries.each do |competition_entry|
      prediction = competition_entry.predictions.build(fixture: self)
      prediction.save
    end
  end
end
