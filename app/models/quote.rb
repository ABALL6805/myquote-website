class Quote < ApplicationRecord
    belongs_to :user
    belongs_to :author
    accepts_nested_attributes_for :author # Copilot code - How do I create fields for a the author model in a quote form?
    has_many :category_quotes, dependent: :destroy
    has_many :categories, through: :category_quotes
end
