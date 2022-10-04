# frozen_string_literal: true

class HomeController < ApplicationController
  layout "application_landing"
  def index
    redirect_to dashboards_path if user_signed_in?
  end
end
