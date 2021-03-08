class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.text :notes
      t.date :start_date
      t.integer :number_of_guests
      t.references :user, null: false, foreign_key: true
      t.references :restaurant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
