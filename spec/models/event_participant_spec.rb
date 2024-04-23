require 'rails_helper'

RSpec.describe EventParticipant, type: :model do
  let(:user) do
    User.create(
      username: 'testusername',
      firstname: 'testfirstname',
      lastname: 'testlastname',
      email: 'test@example.com',
      password: 'password',
      password_confirmation: 'password'
    )
  end

  it 'attaches profile photo to user' do
    file_path = Rails.root.join('spec', 'fixtures', 'profile_photo.png')
    user.profile_photo.attach(io: File.open(file_path), filename: 'profile_photo.png', content_type: 'image/png')

    expect(user.profile_photo).to be_attached
  end

  it "is valid with valid attributes" do
    event = user.events.create(
      title: 'test title',
      body: 'test body',
      eventphoto: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuVuAJ861-8mfwqjppG2J9J5-NHVycCcUzShI_VUehWw&s',
      eventamount: 200.50,
      grouptotal: 400.50,
      creator: 1,
      location: 'test location'
    )

    event_participant = EventParticipant.create(
      user_id: user.id,
      event_id: event.id,
      individual_contributions: 1
    )
    
    expect(event_participant).to be_valid
  end
end
