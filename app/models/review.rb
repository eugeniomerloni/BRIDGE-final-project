# == Schema Information
#
# Table name: reviews
#
#  id          :bigint           not null, primary key
#  body        :text
#  rating      :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  place_id    :integer
#  reviewer_id :integer
#
class Review < ApplicationRecord

  #Direct
  belongs_to :reviewer, required: true, class_name: "User", foreign_key: "reviewer_id"
  belongs_to :place, required: true, class_name: "Place", foreign_key: "place_id"

end
