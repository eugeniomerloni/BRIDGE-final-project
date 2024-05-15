# == Schema Information
#
# Table name: place_types
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#  place_id    :integer
#
class PlaceType < ApplicationRecord

  #Direct
  belongs_to :place, required: true, class_name: "Place", foreign_key: "place_id"
  belongs_to :category, required: true, class_name: "Category", foreign_key: "category_id"
  
end
