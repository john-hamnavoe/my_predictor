# frozen_string_literal: true

class LogoComponent < ApplicationComponent

  def call
    image_tag "football-svgrepo-com.svg", class: "mx-auto h-12 w-auto", alt: "My Predictor"
  end
end
