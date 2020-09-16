class Order < ApplicationRecord
  belongs_to :user
  belongs_to :inventory
  has_one :review
  has_one :chat
  validates :accepted, inclusion: { in: 1..3 }
  monetize :price_cents
end
