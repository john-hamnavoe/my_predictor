# frozen_string_literal: true

class Forms::CheckboxInputComponent < Forms::BaseComponent
  attr_reader :label, :oninput, :classes
  def initialize(form, field, classes: nil, label: nil, oninput: nil)
    @label = label
    @oninput = oninput
    @classes = classes
    super(form, field)
  end
end
