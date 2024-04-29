class EventParticipantsController < ApplicationController
def index
  event_participant = EventParticipant.all
  render json: event_participant
end

def show 
  event_participants = EventParticipant.where(user_id: params[:id])
  event_ids = event_participants.pluck(:event_id)
  current_user_events = event_ids.map { |e_id| Event.where(id: e_id) }.flatten
  if event_participants.present?
    render json: current_user_events, status: 200
  else
    render json: { error: 'Event Participant not found' }, status: 404
  end
end

def create
  event_participant = EventParticipant.create(event_participant_params)
  if event_participant.valid?
    render json: event_participant
  else
    render json: event_participant.errors, status: 422
  end
end

def update
  event_participant = EventParticipant.find(params[:id])
  event_participant.update(event_participant_params)
  if event_participant.valid?
    render json: event_participant
  else
    render json: event_participant.errors, status: 422
  end
end

def destroy
  event_participant = EventParticipant.find(params[:id])
  if event_participant.destroy
    render json: {message: 'Event participant deleted successfully'}, status: 204
  else
    render json: {error: 'Failed to delete event participant'}, status: 422
    end
  end
end

private
def event_participant_params
    params.require(:event_participant).permit(:user_id, :event_id, :individual_contributions)
  end


