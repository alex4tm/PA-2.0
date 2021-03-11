class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :restaurant, optional: true
  has_many :bookings
  has_many :categories, dependent: :destroy
  validates :phone_number, presence: true,
            numericality: true,
            length: { :minimum => 10, :maximum => 15 }
  before_validation :reset, on: :create

  def restaurant_owner?
    self.restaurant.present?
  end

  def reset
    new_uid = SecureRandom.hex(3)
    self.secure_id = new_uid
  end
end
