class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.integer :reservation_date
      t.references :users, foreign_key: true
      t.references :listings, foreign_key: true

      t.timestamps
    end
  end
end
