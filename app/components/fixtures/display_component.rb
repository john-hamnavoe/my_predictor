# frozen_string_literal: true

class Fixtures::DisplayComponent < ApplicationComponent
  attr_reader :fixture

  def initialize(fixture)
    @fixture = fixture
  end

  def scores_present?
    fixture.home_score.nil?
  end

  def font 
    fixture.locked? ? "font-extrabold" : "font-medium"
  end
end
