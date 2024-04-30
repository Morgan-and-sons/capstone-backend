user1 = User.where(email: 'test1@example.com').first_or_create(
  password: 'password',
  password_confirmation: 'password',
  username: 'testusername1',
  firstname: 'John',
  lastname: 'Doe',
)
user2 = User.where(email: 'test2@example.com').first_or_create(
  password: 'password',
  password_confirmation: 'password',
  username: 'testusername2',
  firstname: 'Jane',
  lastname: 'Doe',
)

event_one = {
  title: 'test title 1',
  body: 'test body 1',
  eventphoto: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuVuAJ861-8mfwqjppG2J9J5-NHVycCcUzShI_VUehWw&s',
  eventamount: 800,
  grouptotal: 400.50,
  creator: user1.id,
  location: 'test location 1'
}

event_two = {
  title: 'test title 2',
  body: 'test body 2',
  eventphoto: 'https://images.unsplash.com/photo-1568644396922-5c3bfae12521?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aGFwcHklMjBob3VyfGVufDB8fDB8fHww',
  eventamount: 700,
  grouptotal: 200.50,
  creator: user2.id,
  location: 'test location 2'
}

event_three = {
  title: 'test title 3',
  body: 'test body 3',
  eventphoto: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuVuAJ861-8mfwqjppG2J9J5-NHVycCcUzShI_VUehWw&s',
  eventamount: 900.50,
  grouptotal: 300.00,
  creator: user1.id,
  location: 'test location 3'
}

event_four = {
  title: 'test title 4',
  body: 'test body 4',
  eventphoto: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuVuAJ861-8mfwqjppG2J9J5-NHVycCcUzShI_VUehWw&s',
  eventamount: 100.00,
  grouptotal: 50.00,
  creator: user2.id,
  location: 'test location 4'
}

# Create events
event_one_record = Event.create!(event_one)
event_two_record = Event.create!(event_two)
event_three_record = Event.create!(event_three)
event_four_record = Event.create!(event_four)

# Create event participants
events_one_participant1 = EventParticipant.create(
  user_id: user1.id,
  event_id: event_one_record.id,
  individual_contributions: 15
)

events_two_participant1 = EventParticipant.create(
  user_id: user1.id,
  event_id: event_two_record.id,
  individual_contributions: 20
)

events_two_participant2 = EventParticipant.create(
  user_id: user2.id,
  event_id: event_one_record.id,
  individual_contributions: 50
)

events_three_participant1 = EventParticipant.create(
  user_id: user1.id,
  event_id: event_three_record.id,
  individual_contributions: 25
)

events_three_participant2 = EventParticipant.create(
  user_id: user2.id,
  event_id: event_three_record.id,
  individual_contributions: 30
)

events_four_participant1 = EventParticipant.create(
  user_id: user1.id,
  event_id: event_four_record.id,
  individual_contributions: 40
)