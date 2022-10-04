# frozen_string_literal: true

class PrimaryLinkButtonComponent < ApplicationComponent
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
    "#{button_classes} flex items-center justify-center rounded-md border border-transparent bg-indigo-900 px-4 py-3 text-base font-medium text-white shadow-sm hover:bg-opacity-70 sm:px-8"
  end
end
