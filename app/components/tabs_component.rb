# frozen_string_literal: true

class TabsComponent < ApplicationComponent
  renders_many :tabs, TabComponent
end
