class Author < ApplicationRecord
  # Validations
  validates :name, presence: true, length: { maximum: 255 }
end