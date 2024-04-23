class Event < ApplicationRecord
  belongs_to :user
  has_many :event_participants

  validates :title, :body, :eventphoto, :eventamount, :grouptotal, :creator, :location, presence: true
end
