class Review < ApplicationRecord
  belongs_to :order
  validates :rating, presence: true, inclusion: { in: 1..5 }
end
