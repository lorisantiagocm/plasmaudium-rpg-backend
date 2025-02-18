# == Schema Information
#
# Table name: videos
#
#  id         :bigint           not null, primary key
#  name       :string
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
class Video < ApplicationRecord
  belongs_to :user
end
