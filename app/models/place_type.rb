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
end
