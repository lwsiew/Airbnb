class RemoveReservationDateFromReservations < ActiveRecord::Migration[5.0]
  def change
    remove_column :reservations, :reservation_date, :string
  end
end
