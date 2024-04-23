class Event < ApplicationRecord
  has_many :event_participants
  has_many :users, through: :event_participants

  validates :title, :body, :eventphoto, :eventamount, :grouptotal, :creator, :location, presence: true
end
