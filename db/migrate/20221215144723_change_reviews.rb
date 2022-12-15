class ChangeReviews < ActiveRecord::Migration[7.0]
  def change

    add_column :reviews, :reviewer_name, :string
    add_column :reviews, :review_date, :string

  end
end
