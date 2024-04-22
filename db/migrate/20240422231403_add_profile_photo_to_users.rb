class AddProfilePhotoToUsers < ActiveRecord::Migration[7.1]
  def change
    add_reference :users, :profile_photo, foreign_key: { to_table: :active_storage_attachments }
  end
end
