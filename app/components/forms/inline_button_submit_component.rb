# frozen_string_literal: true

class Forms::InlineButtonSubmitComponent < ApplicationComponent
  attr_reader :form, :rounded_class

  def initialize(form, rounded_class: nil)
    @form = form
    @rounded_class = rounded_class
  end

  def call
    form.submit class: "-ml-px relative px-2 py-1 border border-indigo-600 text-sm font-medium #{rounded_style} text-white bg-indigo-600 hover:bg-indigo-700"
  end

  private

  def rounded_style
    @rounded_class || "rounded-r-md"
  end
end
