# == Schema Information
#
# Table name: users
#
#  id                   :bigint           not null, primary key
#  dob                  :date
#  email                :text
#  first_name           :string
#  hometown             :text
#  last_name            :string
#  password_digest      :text
#  premium_subscription :boolean
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
class User < ApplicationRecord

  def full_name
    return "#{self.first_name} #{self.last_name}"
  end

  
end
