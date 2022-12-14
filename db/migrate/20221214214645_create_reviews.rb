class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.integer :guest_id, null: false 
      t.integer :property_id, null: false 
      t.integer :rating, null: false 
      t.text :review, null: false

      t.timestamps
    end

    add_index :reviews, :guest_id
    add_index :reviews, :property_id
    add_foreign_key :reviews, :users, column: :guest_id, primary_key: :id
    add_foreign_key :reviews, :properties, column: :property_id, primary_key: :id
  end
end
