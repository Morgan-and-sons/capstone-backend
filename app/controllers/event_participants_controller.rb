class EventParticipantsController < ApplicationController
def index
  event_participant = EventParticipant.all
  render json: event_participant
end

def create 
  event_participant = EventParticipant.create(event_participant_params)
  if event_participant.valid?
    render json: event_participant
  else
    render json: event_participant.errors, status: 422
  end
end


def event_participant_params
    params.require(:event_participant).permit(:user_id, :event_id, :individual_contributions)
  end
end


