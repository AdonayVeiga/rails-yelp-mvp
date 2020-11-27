class Review < ApplicationRecord
  belongs_to :restaurant
  validates :restaurant, :rating, :content, presence: true
  validates :rating, numericality: true, inclusion: { in: (0..5) }
end
