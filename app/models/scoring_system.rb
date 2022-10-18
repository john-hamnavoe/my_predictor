class ScoringSystem < ApplicationRecord
  has_many :competitions, dependent: :restrict_with_error
end
