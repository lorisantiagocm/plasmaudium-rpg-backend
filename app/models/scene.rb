# == Schema Information
#
# Table name: scenes
#
#  id          :bigint           not null, primary key
#  campaign_id :bigint           not null
#  name        :string
#  icon        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Scene < ApplicationRecord
  belongs_to :campaign

  validates :name, uniqueness: { scope: :campaign_id }
end
