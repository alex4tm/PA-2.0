class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :name, :address, :tables_capacity, :category, :rating, presence: true
  validates :name, :address, uniqueness: true
end
