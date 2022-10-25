# frozen_string_literal: true

class Fixtures::BadgeScoreComponent < ApplicationComponent
  attr_reader :score

  def initialize(score)
    @score = score
  end
end
