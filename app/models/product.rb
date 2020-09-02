class Product < ApplicationRecord
  belongs_to :inventory
  validates :name, :price, presence: true
end
