class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.integer :host_id, null: false
      t.string :host_name, null: false
      t.string :property_name, null: false
      t.text :description, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.float :price, null: false
      t.integer :num_beds, null: false
      t.integer :num_baths, null: false
      t.float :lng, null: false
      t.float :lat, null: false

      t.timestamps
    end

    add_index :properties, :host_id
    add_index :properties, :city
    add_index :properties, :state
    add_foreign_key :properties, :users, column: :host_id, primary_key: :id
  end
end
