class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.integer :place_id
      t.integer :reviewer_id
      t.float :rating
      t.text :body

      t.timestamps
    end
  end
end
