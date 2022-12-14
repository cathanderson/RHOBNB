class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false, index: { unique: true }
      t.string :password_digest, null: false
      t.string :session_token, null: false, index: { unique: true } 
      t.string :rh_franchise

      t.timestamps
    end
    
    add_index :users, :rh_franchise
  end
end
