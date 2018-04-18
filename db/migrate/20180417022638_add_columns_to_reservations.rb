class AddColumnsToReservations < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations, :check_in, :string
    add_column :reservations, :check_out, :string
  end
end
