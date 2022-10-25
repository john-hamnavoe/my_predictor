# frozen_string_literal: true

class Forms::TextInputComponent < Forms::BaseComponent
  def initialize(form, field, classes: nil, type: :text, placeholder: nil, autocomplete: nil, autofocus: false, data: nil, read_only: false, rounded: false)
    super(form, field)
    @type = type
    @placeholder = placeholder
    @autocomplete = autocomplete || :off
    @autofocus = autofocus
    @classes = classes
    @data = data
    @rounded = rounded
    @read_only = read_only
  end

  def call
    form.send(method, field, class: input_class, autocomplete: @autocomplete, placeholder: @placeholder, autofocus: @autofocus, data: @data, min: min, disabled: @read_only)
  end

  private

  def method
    "#{@type}_field"
  end

  def rounded_class 
    @rounded ? "rounded-md" : "rounded-none"
  end

  def min
    @type == :number ? 0 : nil
  end

  def input_class
    "#{@classes} disabled:bg-gray-200 relative block appearance-none #{rounded_class} #{width_class} border border-gray-300 px-2 py-1 text-gray-900 placeholder-gray-500 focus:z-10 focus:border-indigo-500 focus:outline-none focus:ring-indigo-500 sm:text-sm"
  end

  def width_class
    @classes&.include?("w-") ? "" : "w-full"
  end
end
