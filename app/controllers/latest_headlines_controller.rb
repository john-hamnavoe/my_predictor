class LatestHeadlinesController < ApplicationController
  def show
    @competition = Competition.find(params[:competition_id])
    @news = News.where(competition: @competition).order(date: :desc).limit(5)
  end
end
