# frozen_string_literal: true

class Forms::TextInputComponent < Forms::BaseComponent
  def initialize(form, field, classes: nil, type: :text, placeholder: nil, autocomplete: nil, autofocus: false, data: nil, rounded: false)
    super(form, field)
    @type = type
    @placeholder = placeholder
    @autocomplete = autocomplete || :off
    @autofocus = autofocus
    @classes = classes
    @data = data
    @rounded = rounded
  end

  def call
    form.send(method, field, class: input_class, autocomplete: @autocomplete, placeholder: @placeholder, autofocus: @autofocus, data: @data)
  end

  private

  def method
    "#{@type}_field"
  end

  def rounded_class 
    @rounded ? "rounded-md" : "rounded-none"
  end

  def input_class
    "#{@classes} relative block w-full appearance-none #{rounded_class} border border-gray-300 px-3 py-2 text-gray-900 placeholder-gray-500 focus:z-10 focus:border-indigo-500 focus:outline-none focus:ring-indigo-500 sm:text-sm"
  end
end
