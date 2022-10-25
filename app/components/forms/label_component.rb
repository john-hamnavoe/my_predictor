# frozen_string_literal: true

class Forms::LabelComponent < ApplicationComponent
  attr_reader :form, :field, :label, :help, :label_class

  def initialize(form, field, label: nil, label_class: nil)
    @form = form
    @field = field
    @label = label
    @label_class = label_class
  end


  def label_classes
    @label_class || "block text-sm font-medium text-gray-700 px-4 py-2" 
  end  
end
