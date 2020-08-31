class Order < ApplicationRecord
  belongs_to :user
  belongs_to :inventory
  has_one :review
end
