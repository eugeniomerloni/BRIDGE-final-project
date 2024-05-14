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
end
