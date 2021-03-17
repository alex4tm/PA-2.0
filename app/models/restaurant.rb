class Restaurant < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_one :user
  validates :name, :address, :tables_capacity, :category, :rating, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_one_attached :photo
end
