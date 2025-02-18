class CreateCampaigns < ActiveRecord::Migration[7.2]
  def change
    create_table :campaigns do |t|
      t.string :name
      t.string :description
      t.string :color

      t.timestamps
    end
  end
end
