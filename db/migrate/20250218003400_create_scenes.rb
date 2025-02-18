class CreateScenes < ActiveRecord::Migration[7.2]
  def change
    create_table :scenes do |t|
      t.references :campaign, null: false, foreign_key: true
      t.string :name
      t.string :icon

      t.timestamps
    end
  end
end
