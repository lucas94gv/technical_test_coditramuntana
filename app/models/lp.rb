# frozen_string_literal: true

# Model representing a lp with associated attributes and behavior
class Lp < ApplicationRecord
  # Validations
  validates :name, presence: true, length: { maximum: 255 }
  validates :description, length: { maximum: 1000 }, allow_blank: true
  validates :artist, presence: true

  # Associations
  belongs_to :artist
  has_many :songs, dependent: :destroy
end
