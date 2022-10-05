# frozen_string_literal: true

class Forms::TextInputComponent < Forms::BaseComponent
  def initialize(form, field, classes: nil, type: :text, placeholder: nil, autocomplete: nil, autofocus: false, data: nil)
    super(form, field)
    @type = type
    @placeholder = placeholder
    @autocomplete = autocomplete || :off
    @autofocus = autofocus
    @classes = classes
    @data = data
  end

  def call
    form.send(method, field, class: input_class, autocomplete: @autocomplete, placeholder: @placeholder, autofocus: @autofocus, data: @data)
  end

  private

  def method
    "#{@type}_field"
  end

  def input_class
    "#{@classes} relative block w-full appearance-none rounded-none border border-gray-300 px-3 py-2 text-gray-900 placeholder-gray-500 focus:z-10 focus:border-indigo-500 focus:outline-none focus:ring-indigo-500 sm:text-sm"
  end
end
