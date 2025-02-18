# == Schema Information
#
# Table name: video_scenes
#
#  id         :bigint           not null, primary key
#  video_id   :bigint           not null
#  scene_id   :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class VideoScene < ApplicationRecord
  belongs_to :video
  belongs_to :scene
end
