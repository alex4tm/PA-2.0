class Restaurant < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_one :user
  validates :name, :address, :tables_capacity, :category, :rating, presence: true

  has_one_attached :photo
end
