class FixturesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_competition

  def index
    @fixtures = @competition.fixtures.order(:date)
  end  

  def edit
    editing_score = params[:edit_score] == "true"
    @edit_form = editing_score ? "edit_score_form" : "form"
    @fixture = Fixture.find_by(id: params[:id])
  end

  def update
    @fixture = Fixture.find_by(id: params[:id])
    respond_to do |format|
      if @fixture.update(fixture_params)
        format.turbo_stream
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace("#{helpers.dom_id(@fixture)}_form", partial: "form", locals: { fixture: @fixture, team_category_id: @competition.team_category_id }) }
      end  
    end  
  end

  def create
    @fixture = Fixture.new(fixture_params)
    @fixture.competition = @competition
  
    respond_to do |format|
      if @fixture.save
        format.turbo_stream
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace("#{helpers.dom_id(@fixture)}_form", partial: "form", locals: { fixture: @fixture, team_category_id: @competition.team_category_id }) }
      end
    end    
  end

  private 

  def fixture_params
    params.require(:fixture).permit(:home_team_id, :away_team_id, :competition_id, :date, :home_score, :away_score, :locked)
  end

  def set_competition
    @competition = Competition.find(params[:competition_id])
  end
end
