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
    "#{link_classes} #{active_class} rounded-md text-base font-medium py-2 px-3 text-gray-500 hover:text-gray-900 #{path}"
  end

  def active_class 
    request.path.start_with?(path) ? "bg-gray-200" : ""
  end
end
