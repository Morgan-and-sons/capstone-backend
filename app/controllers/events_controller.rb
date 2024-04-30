class EventsController < ApplicationController
  def index
    events = Event.all
    render json: events
  end
  
  def create
    event = Event.create(event_params)
    if event.valid?
      create_event_participant = EventParticipant.create(user_id: event.creator, event_id: event.id, individual_contributions: 0)
      render json: event
    else
      render json: event.errors, status: 422
    end
  end

  def update 
    event = Event.find(params[:id])
    event.update(event_params)
    if event.valid?
      render json: event
    else
      render json: event.errors, status: 422
    end
  end

  def destroy
    event = Event.find(params[:id])
    if event.destroy
      render json: {message: 'Event deleted successfully'}, status: 204
    else
      render json: {error: 'Failed to delete event'}, status: 422
    end
  end
end


private
def event_params
  params.require(:event).permit(:title, :body, :eventphoto, :eventamount, :grouptotal, :creator, :location)
end