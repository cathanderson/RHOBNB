class ChangeCheckInCheckOutDataType < ActiveRecord::Migration[7.0]
  def change
    change_column :reservations, :check_in_date, :date
    change_column :reservations, :check_out_date, :date
  end
end
