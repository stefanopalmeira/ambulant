class Order < ApplicationRecord
  belongs_to :user
  belongs_to :inventory
  has_one :review
  validates :accepted, inclusion: { in: 1..3 }
end
