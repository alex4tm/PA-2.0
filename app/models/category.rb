class Category < ApplicationRecord
  belongs_to :user
  has_many :preferences, dependent: :destroy
  validates :name, :user, presence: true
  validates :name, uniqueness: true
end
