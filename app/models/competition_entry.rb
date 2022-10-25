class CompetitionEntry < ApplicationRecord
  belongs_to :competition
  belongs_to :user
  belongs_to :winner, class_name: "Team", optional: true
  belongs_to :runner_up, class_name: "Team", optional: true

  validates :competition, uniqueness: { scope: :user }
end
