class AddUserToTags < ActiveRecord::Migration[7.2]
  def change
    add_reference :tags, :user, null: false, foreign_key: true
  end
end
