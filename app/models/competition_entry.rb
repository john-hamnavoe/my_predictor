class CompetitionEntry < ApplicationRecord
  belongs_to :competition
  belongs_to :user
  belongs_to :winner, class_name: "Team", optional: true
  belongs_to :runner_up, class_name: "Team", optional: true
  has_many :predictions, dependent: :destroy

  after_commit :create_predictions, on: [:create]

  validates :competition, uniqueness: { scope: :user }

  def create_predictions
    competition.fixtures.each do |fixture|
      prediction = predictions.build(fixture: fixture)
      prediction.save
    end
  end
end
