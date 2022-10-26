class LeagueTablesController < ApplicationController
  before_action :authenticate_user!

  def show
    @competition = Competition.find(params[:competition_id])
    @entries = @competition.competition_entries.eager_load(:user).order(points: :desc, correct_scores: :desc, goal_difference: :asc)
  end
end
