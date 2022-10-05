class Team < ApplicationRecord
  belongs_to :team_category
  validates_presence_of :name
end
