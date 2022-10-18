class Competition < ApplicationRecord
  belongs_to :user
  belongs_to :team_category
  belongs_to :scoring_system
end
