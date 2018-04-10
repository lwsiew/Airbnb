class CreateListingsUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :listings_users do |t|
      t.references :user, foreign_key: true
      t.references :listing, foreign_key: true

      t.timestamps
    end
  end
end
