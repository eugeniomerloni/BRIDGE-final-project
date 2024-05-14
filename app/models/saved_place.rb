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
end
