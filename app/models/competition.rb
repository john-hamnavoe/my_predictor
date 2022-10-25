class Competition < ApplicationRecord
  belongs_to :user
  belongs_to :team_category
  belongs_to :scoring_system
  has_many :fixtures, dependent: :restrict_with_error
  accepts_nested_attributes_for :fixtures

  validates_presence_of :name
end
