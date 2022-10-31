class News < ApplicationRecord
  belongs_to :user
  belongs_to :competition, optional: true
  has_rich_text :article

  validates :headline, presence: true
  validates :date, presence: true
end
