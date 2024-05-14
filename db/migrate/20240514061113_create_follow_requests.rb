class CreateFollowRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :follow_requests do |t|
      t.integer :recipient_id
      t.integer :sender_id
      t.boolean :accepted

      t.timestamps
    end
  end
end
