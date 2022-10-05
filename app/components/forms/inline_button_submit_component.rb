# frozen_string_literal: true

class Forms::InlineButtonSubmitComponent < ApplicationComponent
  attr_reader :form

  def initialize(form)
    @form = form
  end

  def call
    form.submit class: "-ml-px relative px-4 py-2 border border-indigo-600 text-sm font-medium rounded-r-md text-white bg-indigo-600 hover:bg-indigo-700"
  end
end
