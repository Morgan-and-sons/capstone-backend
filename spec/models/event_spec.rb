require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:user) { User.create(
    username: 'testusername',
    firstname: 'testfirstname',
    lastname: 'testlastname',
    email: 'test@example.com',
    password: 'password',
    password_confirmation: 'password'
  ) }

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
end

  it 'is not a valid event without a title attribiute' do
    event = user.events.create(
      body: 'test body',
      eventphoto: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuVuAJ861-8mfwqjppG2J9J5-NHVycCcUzShI_VUehWw&s',
      eventamount: 200.50,
      grouptotal: 400.50,
      creator: 1,
      location: 'test location',
    )
    expect(event).not_to be_valid
    expect(event.errors[:title].first).to eq("can't be blank")
  end

  it 'is not a valid event without a body attribiute' do
    event = user.events.create(
      title: 'test title',
      eventphoto: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuVuAJ861-8mfwqjppG2J9J5-NHVycCcUzShI_VUehWw&s',
      eventamount: 200.50,
      grouptotal: 400.50,
      creator: 1,
      location: 'test location',
    )
    expect(event).not_to be_valid
    expect(event.errors[:body].first).to eq("can't be blank")
  end

  it 'is not a valid event without an eventphoto attribiute' do
    event = user.events.create(
      title: 'test title',
      body: 'test body',
      eventamount: 200.50,
      grouptotal: 400.50,
      creator: 1,
      location: 'test location',
    )
    expect(event).not_to be_valid
    expect(event.errors[:eventphoto].first).to eq("can't be blank")
  end

  it 'is not a valid event without an eventamount attribiute' do
    event = user.events.create(
      title: 'test title',
      body: 'test body',
      eventphoto: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuVuAJ861-8mfwqjppG2J9J5-NHVycCcUzShI_VUehWw&s',
      grouptotal: 400.50,
      creator: 1,
      location: 'test location',
    )
    expect(event).not_to be_valid
    expect(event.errors[:eventamount].first).to eq("can't be blank")
  end

  it 'is not a valid event without a grouptotal attribiute' do
    event = user.events.create(
      title: 'test title',
      body: 'test body',
      eventphoto: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuVuAJ861-8mfwqjppG2J9J5-NHVycCcUzShI_VUehWw&s',
      eventamount: 200.50,
      creator: 1,
      location: 'test location',
    )
    expect(event).not_to be_valid
    expect(event.errors[:grouptotal].first).to eq("can't be blank")
  end

  it 'is not a valid event without a creator attribiute' do
    event = user.events.create(
      title: 'test title',
      body: 'test body',
      eventphoto: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuVuAJ861-8mfwqjppG2J9J5-NHVycCcUzShI_VUehWw&s',
      eventamount: 200.50,
      grouptotal: 400.50,
      location: 'test location',
    )
    expect(event).not_to be_valid
    expect(event.errors[:creator].first).to eq("can't be blank")
  end

  it 'is not a valid event without a location attribiute' do
    event = user.events.create(
      title: 'test title',
      body: 'test body',
      eventphoto: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuVuAJ861-8mfwqjppG2J9J5-NHVycCcUzShI_VUehWw&s",
      eventamount: 200.50,
      grouptotal: 400.50,
      creator: 1,
    )
    expect(event).not_to be_valid
    expect(event.errors[:location].first).to eq("can't be blank")
  end
end


