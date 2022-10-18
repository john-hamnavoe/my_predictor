class TeamCategory < ApplicationRecord
  has_many :competitions, dependent: :restrict_with_error
end
