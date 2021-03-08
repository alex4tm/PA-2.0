class Preference < ApplicationRecord
  belongs_to :category
  validates :name, :description, presence: true
  validates :name, uniqueness: true
end
