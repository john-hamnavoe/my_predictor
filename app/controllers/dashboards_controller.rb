class DashboardsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @competition_entries = current_user.competition_entries.joins(:competition).where(competition: {active: true})
  end
end
