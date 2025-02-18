# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2025_02_18_003512) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campaigns", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scenes", force: :cascade do |t|
    t.bigint "campaign_id", null: false
    t.string "name"
    t.string "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_scenes_on_campaign_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "videos", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "videos_scenes", force: :cascade do |t|
    t.bigint "video_id", null: false
    t.bigint "scene_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["scene_id"], name: "index_videos_scenes_on_scene_id"
    t.index ["video_id"], name: "index_videos_scenes_on_video_id"
  end

  create_table "videos_tags", force: :cascade do |t|
    t.bigint "video_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id"], name: "index_videos_tags_on_tag_id"
    t.index ["video_id"], name: "index_videos_tags_on_video_id"
  end

  add_foreign_key "scenes", "campaigns"
  add_foreign_key "videos_scenes", "scenes"
  add_foreign_key "videos_scenes", "videos"
  add_foreign_key "videos_tags", "tags"
  add_foreign_key "videos_tags", "videos"
end
