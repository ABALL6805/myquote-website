class Author < ApplicationRecord
    has_many :quotes, dependent: :restrict_with_error
    has_many :biographies, dependent: :destroy
end
