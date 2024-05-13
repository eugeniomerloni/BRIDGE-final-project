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
end
