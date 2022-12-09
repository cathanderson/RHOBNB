class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.integer :guest_id, null: false 
      t.integer :property_id, null: false 
      t.datetime :check_in_date, null: false 
      t.datetime :check_out_date, null: false
      t.integer :num_guests, null: false 
      
      t.timestamps
    end

    add_index :reservations, :guest_id
    add_index :reservations, :property_id
    add_foreign_key :reservations, :users, column: :guest_id, primary_key: :id
    add_foreign_key :reservations, :properties, column: :property_id, primary_key: :id
  end
end
