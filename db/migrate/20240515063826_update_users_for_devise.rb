class UpdateUsersForDevise < ActiveRecord::Migration[7.0]
  def change
    # Rename password_digest to encrypted_password and change type to string
    rename_column(:users, :password_digest, :encrypted_password)
    change_column(:users, :encrypted_password, :string, :null => false, :default => "")

    # Change the email column from text to string
    change_column(:users, :email, :string, :null => false, :default => "")

    # Add additional Devise columns
    add_column(:users, :reset_password_token, :string)
    add_column(:users, :reset_password_sent_at, :datetime)
    add_column(:users, :remember_created_at, :datetime)
    add_column(:users, :sign_in_count, :integer, :default => 0, :null => false)
    add_column(:users, :current_sign_in_at, :datetime)
    add_column(:users, :last_sign_in_at, :datetime)
    add_column(:users, :current_sign_in_ip, :string)
    add_column(:users, :last_sign_in_ip, :string)

    # Add indexes for columns used by Devise
    add_index(:users, :email, :unique => true)
    add_index(:users, :reset_password_token, :unique => true)
  end
end
