# frozen_string_literal: true

class Forms::SelectInputComponent < Forms::BaseComponent
  private attr_reader :options, :include_blank, :classes, :read_only, :rounded, :data

  def initialize(form, field, options:, classes: nil, include_blank: false, read_only: false, rounded: false, data: nil)
    super(form, field)
    @options = options
    @include_blank = include_blank
    @classes = classes
    @read_only = read_only
    @rounded = rounded
    @data = data
  end

  def call
    form.select field, options, {include_blank: include_blank}, {class: input_class, disabled: read_only, data: data}
  end

  private 

  def rounded_class 
    @rounded ? "rounded-md" : "rounded-none"
  end

  def input_class
    "#{@classes} disabled:bg-gray-200 relative block w-full appearance-none #{rounded_class} border border-gray-300 px-2 py-1 text-gray-900 placeholder-gray-500 focus:z-10 focus:border-indigo-500 focus:outline-none focus:ring-indigo-500 sm:text-sm"
  end
end
