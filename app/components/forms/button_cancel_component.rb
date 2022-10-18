# frozen_string_literal: true

class Forms::ButtonCancelComponent < ApplicationComponent
  private attr_reader :title, :path

  def initialize(path, title = "Cancel")
    @title = title
    @path = path
  end

  def call
    link_to title, path, class: classes
  end

  private

  def classes
    "rounded-md border border-gray-300 bg-white py-2 px-4 text-sm font-medium text-gray-700 shadow-sm hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2"
  end
end
