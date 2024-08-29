# frozen_string_literal: true

# Model representing an auhor with associated attributes and behavior
class Author < ApplicationRecord
  # Validations
  validates :name, presence: true, length: { maximum: 255 }

  # Associations
  has_and_belongs_to_many :songs
end
