class ChangeProperties < ActiveRecord::Migration[7.0]
  def change

    add_column :properties, :rh_franchise, :string, null: false
    
  end
end
