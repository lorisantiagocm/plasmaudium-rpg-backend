# == Schema Information
#
# Table name: video_tags
#
#  id         :bigint           not null, primary key
#  video_id   :bigint           not null
#  tag_id     :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class VideoTag < ApplicationRecord
  belongs_to :video
  belongs_to :tag
end
