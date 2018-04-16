class RemoveColumnsFromReservations < ActiveRecord::Migration[5.0]
  def change
    remove_column :reservations, :users_id, :string
    remove_column :reservations, :listings_id, :string
  end
end
