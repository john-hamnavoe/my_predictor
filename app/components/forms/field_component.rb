# frozen_string_literal: true

class Forms::FieldComponent < ApplicationComponent
  renders_one :input, types: {
    text: ->(**args) { Forms::TextInputComponent.new(form, field, **args) },
    select: ->(**args) { Forms::SelectInputComponent.new(form, field, **args) },
    date: ->(**args) { Forms::TextInputComponent.new(form, field, type: :date, **args) },
    # time: ->(**args) { Forms::TextInputComponent.new(form, field, type: :time, **args) },
    email: ->(**args) { Forms::TextInputComponent.new(form, field, type: :email, **args) },    
    password: ->(**args) { Forms::TextInputComponent.new(form, field, type: :password, **args) }        
    # ,number: ->(**args) { Forms::TextInputComponent.new(form, field, type: :number, **args) }    
  }

  attr_reader :form, :field, :label, :help, :label_class

  def initialize(form, field, label: nil, label_class: nil, help: nil)
    @form = form
    @field = field
    @label = label
    @help = help
    @label_class = label_class
    @help = help
  end

  def label_classes
    @label_class || "block text-sm font-medium text-gray-700" 
  end
end
