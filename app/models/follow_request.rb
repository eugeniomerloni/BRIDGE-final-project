# == Schema Information
#
# Table name: follow_requests
#
#  id           :bigint           not null, primary key
#  accepted     :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  recipient_id :integer
#  sender_id    :integer
#
class FollowRequest < ApplicationRecord

  #Direct
  belongs_to :recipient, required: true, class_name: "User", foreign_key: "recipient_id"
  belongs_to :sender, required: true, class_name: "User", foreign_key: "sender_id"
  
end
