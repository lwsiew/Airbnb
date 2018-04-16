class ChangeColumnOfReservation < ActiveRecord::Migration[5.0]
  def change
  	change_column :reservations, :reservation_date, :string
  end
end
