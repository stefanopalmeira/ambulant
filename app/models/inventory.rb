class Inventory < ApplicationRecord
  belongs_to :selling_user, class_name: 'User', foreign_key: 'user_id'
  has_many :orders
  has_many :buying_users, through: :orders, source: 'user'
  validates :name, :description, presence: true
  has_many_attached :photos
end
