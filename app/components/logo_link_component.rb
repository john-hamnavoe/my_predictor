# frozen_string_literal: true

class LogoLinkComponent < ApplicationComponent
  private attr_reader :path
  
  def initialize(path)
    @path = path
  end
end
