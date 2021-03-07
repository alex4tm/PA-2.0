class Restaurant < ApplicationRecord

  validates :name, :address, :tables_capacity, :category, :rating, presence: true
end
