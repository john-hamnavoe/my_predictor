# frozen_string_literal: true

class Forms::ButtonSubmitComponent < ApplicationComponent
  attr_reader :text, :button_classes

  def initialize(text: nil, button_classes: nil)
    @text = text || "Save"
    @button_classes = button_classes
  end
end
