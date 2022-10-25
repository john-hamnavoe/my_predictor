class CompetitionEntriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_competition_entry, only: [:edit, :update]

  def new
    set_available_competitions
  end

  def edit
  end

  def update
  end

  def create
    @competition_entry = CompetitionEntry.new(competition_entry_params)
    @competition_entry.user = current_user
    if @competition_entry.save
      redirect_to root_path, notice: "Competition entry was successfully created."
    else
      set_available_competitions
      render :new, status: :unprocessable_entity
    end
  end

  private

  def competition_entry_params
    params.require(:competition_entry).permit(:competition_id, :user_id, :winner_id, :runner_up_id)
  end
  
  def set_competition_entry
    @competition_entry = CompetitionEntry.find(params[:id])
  end

  def set_available_competitions
    @available_competitions = Competition.where(active: true, public: true).where.not(id: current_user.competition_entries.pluck(:competition_id))
  end
end
