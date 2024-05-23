# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Category < ApplicationRecord

  validates(:name, uniqueness: true)


  #DIrect
  has_many  :place_types, class_name: "PlaceType", foreign_key: "category_id", dependent: :destroy

  #Indirect
  has_many :places, through: :place_types, source: :place


end
