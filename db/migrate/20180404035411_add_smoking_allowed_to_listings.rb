class AddSmokingAllowedToListings < ActiveRecord::Migration[5.0]
  def change
    add_column :listings, :smoking_allowed, :boolean
  end
end
