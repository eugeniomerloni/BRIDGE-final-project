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
end
