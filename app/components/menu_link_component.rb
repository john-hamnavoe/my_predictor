# frozen_string_literal: true

class MenuLinkComponent < ApplicationComponent
  private attr_reader :title, :path, :link_classes, :data

  def initialize(title:, path:, link_classes: nil, data: nil)
    @title = title
    @path = path
    @link_classes = link_classes
    @data = data
  end

  def call
    link_to title, path, class: classes, data: data
  end

  private

  def classes
    "#{link_classes} text-base font-medium text-gray-500 hover:text-gray-900"
  end
end
