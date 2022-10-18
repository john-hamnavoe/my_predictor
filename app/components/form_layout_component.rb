# frozen_string_literal: true

class FormLayoutComponent < ApplicationComponent
  attr_reader :title, :sub_title

  def initialize(title:, sub_title: "")
    @title = title
    @sub_title = sub_title
  end

end
