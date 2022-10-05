# frozen_string_literal: true

class TabComponent < ApplicationComponent
  attr_reader :name, :path, :active

  def initialize(name:, path:, active: false)
    @name = name
    @path = path
    @active = active
  end

  def classes
    classes = class_names("inline-block py-2 px-4 text-sm font-medium text-center border-b-2 hover:border-gray-300", active_class)
  end

  private

  def active_class
    active ? "border-indigo-500 text-indigo-600" : "border-transparent text-gray-500 hover:text-gray-600"
  end
end
