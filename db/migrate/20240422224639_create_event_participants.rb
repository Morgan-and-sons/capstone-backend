class CreateEventParticipants < ActiveRecord::Migration[7.1]
  def change
    create_table :event_participants do |t|
      t.integer :user_id
      t.integer :event_id
      t.integer :individual_contributions

      t.timestamps
    end
  end
end
