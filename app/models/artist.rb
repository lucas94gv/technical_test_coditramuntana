class Artist < ApplicationRecord
  # Validations
  validates :name, presence: true, length: { maximum: 255 }
  validates :description, length: { maximum: 1000 }, allow_blank: true

  # Associations
  has_many :lps, dependent: :destroy
end
