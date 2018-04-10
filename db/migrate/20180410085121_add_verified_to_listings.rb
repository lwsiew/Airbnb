class AddVerifiedToListings < ActiveRecord::Migration[5.0]
  def change
    add_column :listings, :verified, :boolean, default: false
  end
end
