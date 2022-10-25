# frozen_string_literal: true

module SelectHelper
  def scoring_systems_for_select
    ScoringSystem.all.order(:id).map { |score_sys| [score_sys.name, score_sys.id] }
  end

  def team_categories_for_select
    TeamCategory.all.order(:id).map { |team_cat| [team_cat.name, team_cat.id] }
  end

  def teams_for_select(team_category_id)
    Team.where(team_category_id: team_category_id).order(:name).map { |team| [team.name, team.id] }
  end

  def teams_by_competition_for_select(competition_id)
    teams = Competition.find(competition_id).fixtures.pluck(:home_team_id, :away_team_id).flatten.uniq
    Team.where(id: teams).order(:name).map { |team| [team.name, team.id] }
  end    
end
