# == Schema Information
#
# Table name: campaigns
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :string
#  color       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
class Campaign < ApplicationRecord
  belongs_to :user

  has_many :scenes
end
