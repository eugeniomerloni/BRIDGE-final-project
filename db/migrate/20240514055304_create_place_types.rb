class CreatePlaceTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :place_types do |t|
      t.integer :place_id
      t.integer :category_id

      t.timestamps
    end
  end
end
