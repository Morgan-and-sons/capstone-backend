require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:user) { User.create(
      username: "testusername"
      firstname: "testfirstname"
      lastname: "testlastname"
      profilephoto: 1
      email: 'test@example.com',
      password: 'password',
      password_confirmation: 'password'
    )
    user.profile_photo.attach(io: File.open('/path/to/profile/photo.jpg'), filename: 'profile_photo.jpg', content_type: 'image/jpeg')
  }
end

it 'event is valid with valid attributes' do 
  event = user.event.create(
    title: "test title",
    body: "test body",
    eventphoto: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuVuAJ861-8mfwqjppG2J9J5-NHVycCcUzShI_VUehWw&s",
    eventamount: 200.50,
    grouptotal: 400.50,
    creator: 1,
    location: "test location",
    user_id: user.id
  )
end