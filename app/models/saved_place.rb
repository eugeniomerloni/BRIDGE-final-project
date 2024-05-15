# == Schema Information
#
# Table name: saved_places
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  place_id   :integer
#  user_id    :integer
#
class SavedPlace < ApplicationRecord

  #Direct
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"
  belongs_to :place, required: true, class_name: "Place", foreign_key: "place_id"
end
