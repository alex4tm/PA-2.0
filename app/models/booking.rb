class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  validates :notes, :start_date, :number_of_guests, presence: true
  NUMBER = [1, 2, 3, 4, 5, 6, 7]
  validates :number_of_guests, inclusion: { in: NUMBER }
end
