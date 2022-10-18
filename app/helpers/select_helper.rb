# frozen_string_literal: true

module SelectHelper
  def scoring_systems_for_select
    ScoringSystem.all.order(:id).map { |score_sys| [score_sys.name, score_sys.id] }
  end

  def team_categories_for_select
    TeamCategory.all.order(:id).map { |team_cat| [team_cat.name, team_cat.id] }
  end
end
