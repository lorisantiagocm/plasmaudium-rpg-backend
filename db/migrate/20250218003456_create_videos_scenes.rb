class CreateVideosScenes < ActiveRecord::Migration[7.2]
  def change
    create_table :video_scenes do |t|
      t.references :video, null: false, foreign_key: true
      t.references :scene, null: false, foreign_key: true

      t.timestamps
    end
  end
end
