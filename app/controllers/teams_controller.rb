class TeamsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!
  before_action :set_team, only: %i[ edit update ]

  # GET /teams or /teams.json
  def index
    @team_categories = TeamCategory.all
    @team_category_id = params[:team_category_id].presence || TeamCategory.first.id
    @teams = Team.where(team_category_id: @team_category_id).order(:name)
  end

  # GET /teams/1/edit
  def edit
  end

  def create
    @team = Team.new(team_params)
  
    respond_to do |format|
      if @team.save
        format.turbo_stream
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace("#{helpers.dom_id(@team)}_form", partial: "form", locals: { team: @team }) }
      end
    end
  end
  
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.turbo_stream
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace("#{helpers.dom_id(@team)}_form", partial: "form", locals: { team: @team }) }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def team_params
      params.require(:team).permit(:name, :team_category_id)
    end
end
