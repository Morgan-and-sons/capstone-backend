class UpdateUsersProfilePhoto < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :profile_photo_id, :bigint
    add_column :users, :profile_photo_url, :string
  end
end
