# frozen_string_literal: true

class Fixtures::BadgeCorrectComponent < ApplicationComponent
  attr_reader :correct_scores

  def initialize(correct_scores)
    @correct_scores = correct_scores
  end
end
