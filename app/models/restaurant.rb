class Restaurant < ApplicationRecord
  has_many :bookings, dependent: :destroy
  validates :name, :address, :tables_capacity, :category, :rating, presence: true
end
