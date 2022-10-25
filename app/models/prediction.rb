class Prediction < ApplicationRecord
  belongs_to :competition_entry
  belongs_to :fixture
end
