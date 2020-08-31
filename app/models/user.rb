class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders
  has_many :reviews, through: :orders
  has_one :selling_inventory, class_name: 'Inventory', foreign_key: 'user_id'
  has_many :buying_inventories, through: :orders, source: :inventory
  validates :name, presence: true, uniqueness: true
  validates :lat, :long, presence: true
  has_one_attached :photo
end
