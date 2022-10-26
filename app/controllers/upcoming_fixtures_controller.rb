class UpcomingFixturesController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @competition = Competition.find(params[:competition_id])
    @fixtures = @competition.fixtures.where("date BETWEEN ? AND ?", Time.zone.today-2, Time.zone.today+2).order(date: :asc)
  end
end
