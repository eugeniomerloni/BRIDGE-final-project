class CreatePlaces < ActiveRecord::Migration[7.0]
  def change
    create_table :places do |t|
      t.string :name
      t.text :description
      t.string :image
      t.text :street_address
      t.text :city
      t.integer :zip_code

      t.timestamps
    end
  end
end
