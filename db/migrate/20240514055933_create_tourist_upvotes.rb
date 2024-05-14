class CreateTouristUpvotes < ActiveRecord::Migration[7.0]
  def change
    create_table :tourist_upvotes do |t|
      t.integer :place_id
      t.integer :tourist_id

      t.timestamps
    end
  end
end
