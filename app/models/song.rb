class Song < ApplicationRecord
  # Validations
  validates :name, presence: true, length: { maximum: 255 }
  validates :lp, presence: true

  # Associations
  belongs_to :lp
end