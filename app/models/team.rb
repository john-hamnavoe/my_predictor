class Team < ApplicationRecord
  belongs_to :team_category
  has_many :home_fixtures, class_name: "Fixture", foreign_key: "home_team_id", dependent: :restrict_with_error
  has_many :away_fixtures, class_name: "Fixture", foreign_key: "away_team_id", dependent: :restrict_with_error
  validates_presence_of :name
end
