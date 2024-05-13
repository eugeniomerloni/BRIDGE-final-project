class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.text :email
      t.date :dob
      t.text :password_digest
      t.boolean :premium_subscription
      t.text :hometown

      t.timestamps
    end
  end
end
