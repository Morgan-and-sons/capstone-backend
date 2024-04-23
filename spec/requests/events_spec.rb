require 'rails_helper'

RSpec.describe 'Events', type: :request do
  let(:user) { User.create(
    username: 'testusername',
    firstname: 'testfirstname',
    lastname: 'testlastname',
    email: 'test@example.com',
    password: 'password',
    password_confirmation: 'password'
  ) 
}


  describe 'GET /index' do
    it 'returns a list of events and http success' do
      event = user.events.create(
        title: 'test title',
        body: 'test body',
        eventphoto: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuVuAJ861-8mfwqjppG2J9J5-NHVycCcUzShI_VUehWw&s',
        eventamount: 200.50,
        grouptotal: 400.50,
        creator: 1,
        location: 'test location'
  )
  get events_path 
  expect(response).to have_http_status(200)
  expect(event).to be_valid
    end
  end

  describe 'POST #create' do
  it 'creates a valid event with a http success' do 
    post events_path, params: {
      event: {
        title: 'test title',
        body: 'test body',
        eventphoto: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuVuAJ861-8mfwqjppG2J9J5-NHVycCcUzShI_VUehWw&s',
        eventamount: 200.50,
        grouptotal: 400.50,
        creator: 1,
        location: 'test location'
      }
    }
    event = Event.where(title: 'test title').first
    expect(response).to have_http_status(200)
    expect(event).to be_valid
  end
end
  it 'creates an invalid event' do 
    post events_path, params: {
      event: {
        title: nil,
        body: nil,
        eventphoto: nil,
        eventamount: nil,
        grouptotal: nil,
        creator: nil,
        location: nil
      }
    }
    event = Event.where(title: nil).first
    expect(response).to have_http_status(422)
    expect(event).to eq(nil)
  end 

  describe 'PATCH #update' do
  it 'updates a valid event with http success' do
    post events_path, params: {
      event: {
        title: 'test title1',
        body: 'test body1',
        eventphoto: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuVuAJ861-8mfwqjppG2J9J5-NHVycCcUzShI_VUehWw&s',
        eventamount: 200.51,
        grouptotal: 400.51,
        creator: 1,
        location: 'test location1'
      }
    }

    event = Event.where(title: 'test title1').first
    patch event_path(event), params: {
      event: {
        title: 'test title for patch',
        body: 'test body for patch',
        eventphoto: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuVuAJ861-8mfwqjppG2J9J5-NHVycCcUzShI_VUehWw&s',
        eventamount: 300.51,
        grouptotal: 400.51,
        creator: 1,
        location: 'test location for patch'
      }
    }

    event = Event.where(title: 'test title for patch').first
    expect(event.title).to eq('test title for patch')
    expect(event.body).to eq('test body for patch')
    expect(event.eventphoto).to eq('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuVuAJ861-8mfwqjppG2J9J5-NHVycCcUzShI_VUehWw&s')
    expect(event.eventamount).to eq(300.51)
    expect(event.grouptotal).to eq(400.51)
    expect(event.creator).to eq(1)
    expect(event.location).to eq('test location for patch')
    expect(response).to have_http_status(200)
  end

it 'returns an http status error for an invalid update' do 
  post events_path, params: {
    event: {
        title: 'test title for patch',
        body: 'test body for patch',
        eventphoto: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuVuAJ861-8mfwqjppG2J9J5-NHVycCcUzShI_VUehWw&s',
        eventamount: 300.51,
        grouptotal: 400.51,
        creator: 1,
        location: 'test location for patch'
    }
  }
  event = Event.where(title:'test title for patch').first
  expect(event).not_to be_nil

  patch event_path(event.id), params: {
    event: {
      title: nil,
      body: nil,
      eventphoto: nil,
      eventamount: nil,
      grouptotal: nil,
      creator: nil,
      location: nil
    }
  }
  event = Event.where(title: nil).first
  expect(response).to have_http_status(422)
    end
  end

  describe 'DELETE #destroy' do
  it 'deletes the event' do
    event = Event.create(
        title: 'test title for delete',
        body: 'test body for delete',
        eventphoto: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuVuAJ861-8mfwqjppG2J9J5-NHVycCcUzShI_VUehWw&s',
        eventamount: 300.51,
        grouptotal: 400.51,
        creator: 1,
        location: 'test location for delete'
    )
    delete event_path(event)
    event = Event.where(title: 'test title for delete').first
    expect(event).to eq(nil)
  end
end
end
