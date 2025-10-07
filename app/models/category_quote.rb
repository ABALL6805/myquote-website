class CategoryQuote < ApplicationRecord
  belongs_to :category
  belongs_to :quote
  validates :name, presence: true
end
