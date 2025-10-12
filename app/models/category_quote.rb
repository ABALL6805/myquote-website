class CategoryQuote < ApplicationRecord
  belongs_to :category
  belongs_to :quote
  validates :category, presence: true
end
