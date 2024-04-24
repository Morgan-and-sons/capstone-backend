require 'rails_helper'

RSpec.describe "EventParticipants", type: :request do
  let(:user) { User.create(
  username: 'testusername',
  firstname: 'testfirstname',
  lastname: 'testlastname',
  email: 'test@example.com',
  password: 'password',
  password_confirmation: 'password'
  ) 
}

  let(:event) { user.events.create(
    title: 'test title',
        body: 'test body',
        eventphoto: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuVuAJ861-8mfwqjppG2J9J5-NHVycCcUzShI_VUehWw&s',
        eventamount: 200.50,
        grouptotal: 400.50,
        creator: user.id,
        location: 'test location'
  )}

  describe 'Get/index' do
    it 'returns a event participants and http success' do 
      event_participant = EventParticipant.create(
        user_id: user.id,
        event_id: event.id,
        individual_contributions: 100,
      )
      get event_participants_path
      expect(response).to have_http_status(200)
      expect(event).to be_valid
    end
  end

  describe 'POST #create' do 
    it 'creates a valid event_participant with a http success' do
      post event_participants_path, params: {
        event_participant: {
          user_id: user.id,
          event_id: event.id,
          individual_contributions: 100,
      }
    }
    event_participant= EventParticipant.where(user_id: user.id).first
    expect(response).to have_http_status(200)
    expect(event_participant).to be_valid
  end

  it 'creates an invalid event_participant' do
    post event_participants_path, params: {
      event_participant: {
      user_id: nil,
      event_id: nil,
      individual_contributions: nil,
    }
  }
  event_participant = EventParticipant.where(user_id: nil).first
  expect(response).to have_http_status(422)
  expect(event_participant).to eq(nil)
    end
  end
end
