class Category < ApplicationRecord
    has_many :category_quotes, dependent: :destroy
    has_many :quotes, through: :category_quotes
end
