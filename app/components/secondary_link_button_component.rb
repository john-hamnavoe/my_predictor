# frozen_string_literal: true

class SecondaryLinkButtonComponent < ApplicationComponent
  private attr_reader :title, :path, :button_classes

  def initialize(path:, title:, button_classes: nil)
    @title = title
    @path = path
    @button_classes = button_classes
  end

  def call
    link_to title, path, class: classes
  end

  private

  def classes
    "#{button_classes} flex items-center justify-center rounded-md border border-transparent bg-white px-4 py-3 text-base font-medium text-indigo-700 shadow-sm hover:bg-indigo-50 sm:px-8"
  end
end
