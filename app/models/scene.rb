class Scene < ApplicationRecord
  belongs_to :campaign

  validates :name, uniqueness: { scope: :campaign_id }
end
