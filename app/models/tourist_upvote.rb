# == Schema Information
#
# Table name: tourist_upvotes
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  place_id   :integer
#  tourist_id :integer
#
class TouristUpvote < ApplicationRecord

  #Direct
  
  belongs_to :tourist, required: true, class_name: "User", foreign_key: "tourist_id"
  belongs_to :place, required: true, class_name: "Place", foreign_key: "place_id"

end
