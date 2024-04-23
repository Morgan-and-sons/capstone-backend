user1 = User.where(email: 'test1@example.com').first_or_create(
  password: 'password',
  password_confirmation: 'password',
  username: 'testusername1',
  firstname: 'John',
  lastname: 'Doe',
  profile_photo_id: 1 
)
user2 = User.where(email: 'test2@example.com').first_or_create(
  password: 'password',
  password_confirmation: 'password',
  username: 'testusername2',
  firstname: 'Jane',
  lastname: 'Doe',
  profile_photo_id: 1 
)

event1 = user1.events.create(
  title: 'test title 1',
  body: 'test body 1',
  eventphoto: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuVuAJ861-8mfwqjppG2J9J5-NHVycCcUzShI_VUehWw&s',
  eventamount: 200.50,
  grouptotal: 400.50,
  location: 'test location 1'
)

event2 = user1.events.create(
  title: 'test title 2',
  body: 'test body 2',
  eventphoto: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuVuAJ861-8mfwqjppG2J9J5-NHVycCcUzShI_VUehWw&s',
  eventamount: 200.50,
  grouptotal: 400.50,
  location: 'test location 2'
)

event1_participant1 = EventParticipant.create(
  user_id: user1.id,
  event_id: event1.id,
  individual_contributions: 1
)

event2_participant1 = EventParticipant.create(
  user_id: user1.id,
  event_id: event2.id,
  individual_contributions: 1
)

event1_participant2 = EventParticipant.create(
  user_id: user2.id,
  event_id: event1.id,
  individual_contributions: 1
)
