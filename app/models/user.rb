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
  # Devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Virtual attribute to get full name
  def full_name
    "#{first_name} #{last_name}"
  end

  # Define getter and setter methods for dob_day, dob_month, and dob_year
  attr_accessor :dob_day, :dob_month, :dob_year

  # Direct Associations
  has_many :reviews, class_name: "Review", foreign_key: "reviewer_id", dependent: :destroy
  has_many :saved_places, class_name: "SavedPlace", foreign_key: "user_id", dependent: :destroy
  has_many :tourist_upvotes, class_name: "TouristUpvote", foreign_key: "tourist_id", dependent: :destroy
  has_many :received_follow_requests, class_name: "FollowRequest", foreign_key: "recipient_id", dependent: :destroy
  has_many :sent_follow_requests, class_name: "FollowRequest", foreign_key: "sender_id", dependent: :destroy

  # Indirect Associations
  has_many :potential_followers, through: :received_follow_requests, source: :sender
  has_many :potential_leaders, through: :sent_follow_requests, source: :recipient
  has_many :reviewed_places, through: :reviews, source: :place
  has_many :favorites, through: :saved_places, source: :place
  has_many :upvoted_places, through: :tourist_upvotes, source: :place

  # Combine dob fields before save
  before_save :combine_dob

  private

  def combine_dob
    if dob_day.present? && dob_month.present? && dob_year.present?
      self.dob = Date.new(dob_year.to_i, Date::MONTHNAMES.index(dob_month), dob_day.to_i)
    end
  end
end
