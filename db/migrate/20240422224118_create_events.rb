class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :title
      t.text :body
      t.text :eventphoto
      t.float :eventamount
      t.float :grouptotal
      t.integer :creator
      t.string :location
      t.integer :user_id

      t.timestamps
    end
  end
end
