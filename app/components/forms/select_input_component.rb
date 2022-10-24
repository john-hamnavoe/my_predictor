# frozen_string_literal: true

class Forms::SelectInputComponent < Forms::BaseComponent
  private attr_reader :options, :include_blank, :classes

  def initialize(form, field, options:, classes: nil, include_blank: false)
    super(form, field)
    @options = options
    @include_blank = include_blank
    @classes = classes
  end

  def call
    form.select field, options, {include_blank: include_blank}, {class: input_class}
  end

  private 

  def input_class
    "#{@classes}  relative block w-full appearance-none rounded-md border border-gray-300 px-2 py-1 mb-2 text-gray-900 placeholder-gray-500 focus:z-10 focus:border-indigo-500 focus:outline-none focus:ring-indigo-500 sm:text-sm"
  end
end
