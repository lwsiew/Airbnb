class RemoveDurationFromReservations < ActiveRecord::Migration[5.0]
  def change
    remove_column :reservations, :duration, :date
  end
end
