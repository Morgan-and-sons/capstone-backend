class EventParticipant < ApplicationRecord
  belongs_to :user
  belongs_to :events
end
