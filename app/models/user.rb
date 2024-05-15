# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string
#  dob                    :date
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  hometown               :text
#  last_name              :string
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string
#  premium_subscription   :boolean
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :validatable

  def full_name
    return "#{self.first_name} #{self.last_name}"
  end
  
  #Direct Associations
  has_many  :reviews, class_name: "Review", foreign_key: "reviewer_id", dependent: :destroy
  has_many  :saved_places, class_name: "SavedPlace", foreign_key: "user_id", dependent: :destroy
  has_many  :tourist_upvotes, class_name: "TouristUpvote", foreign_key: "tourist_id", dependent: :destroy
  has_many  :received_follow_requests, class_name: "FollowRequest", foreign_key: "recipient_id", dependent: :destroy
  has_many  :sent_follow_requests, class_name: "FollowRequest", foreign_key: "sender_id", dependent: :destroy

  #Indirect Associations
  has_many :potential_followers, through: :received_follow_requests, source: :sender
  has_many :potential_leaders, through: :sent_follow_requests, source: :recipient
  has_many :reviewed_places, through: :reviews, source: :place
  has_many :favorites, through: :saved_places, source: :place
  has_many :upvoted_places, through: :tourist_upvotes, source: :place
  
end
