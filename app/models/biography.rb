class Biography < ApplicationRecord
  belongs_to :quote
  belongs_to :author
end
