class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :restaurant, optional: true
  has_many :bookings

  def restaurant_owner?
    self.restaurant.present?
  end
end
