# == Schema Information
#
# Table name: places
#
#  id             :bigint           not null, primary key
#  city           :text
#  description    :text
#  image          :string
#  name           :string
#  street_address :text
#  zip_code       :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Place < ApplicationRecord

  validates(:name, uniqueness: true)

#Direct Associations
has_many  :reviews, class_name: "Review", foreign_key: "place_id", dependent: :destroy
has_many  :place_types, class_name: "PlaceType", foreign_key: "place_id", dependent: :destroy
has_many  :saved_places, class_name: "SavedPlace", foreign_key: "place_id", dependent: :destroy
has_many  :tourist_upvotes, class_name: "TouristUpvote", foreign_key: "place_id", dependent: :destroy

#Indirect Associations
has_many :reviewers, through: :reviews, source: :reviewer
has_many :users, through: :saved_places, source: :user
has_many :tourists, through: :tourist_upvotes, source: :tourist
has_many :categories, through: :place_types, source: :category

end
