user1 = User.where(email: 'smorgannicole@gmail.com').first_or_create(
  password: 'password',
  password_confirmation: 'password',
  username: 'smorgannicole',
  firstname: 'Morgan',
  lastname: 'Smith',
  profile_photo_url: 'https://images.unsplash.com/photo-1591561582301-7ce6588cc286?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8YnVubnl8ZW58MHx8MHx8fDA%3D',
)
user2 = User.where(email: 'ryan@email.com').first_or_create(
  password: 'password',
  password_confirmation: 'password',
  username: 'ryanlemus',
  firstname: 'Ryan',
  lastname: 'Lemus',
  profile_photo_url: 'https://images.pexels.com/photos/1308713/pexels-photo-1308713.jpeg?auto=compress&cs=tinysrgb&w=800',
)

user3 = User.where(email: 'louis@email.com').first_or_create(
  password: 'password',
  password_confirmation: 'password',
  username: 'louismoreno',
  firstname: 'Louis',
  lastname: 'Moreno',
  profile_photo_url: 'https://images.pexels.com/photos/718739/pexels-photo-718739.jpeg?auto=compress&cs=tinysrgb&w=800',
)

event_one = {
  title: 'Fishing with Linda',
  body: 'Linda and I are meeting up at the Calabasas Philz on Friday morning',
  eventphoto: 'https://images.unsplash.com/photo-1553522622-dbbcea69d15f?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjR8fG9sZCUyMGxhZHklMjB0ZWF8ZW58MHx8MHx8fDA%3D',
  eventamount: 30,
  grouptotal: 10,
  creator: user1.id,
  location: 'Calabasas, CA'
}

event_two = {
  title: "Morgan and Son's Texas Ranger's game",
  body: "Morgan, Ryan, and Louis are going to the Texas Ranger's baseball game!!",
  eventphoto: 'https://images.unsplash.com/photo-1624375664562-fff61869fe8f?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fGJhc2ViYWxsfGVufDB8fDB8fHww',
  eventamount: 300,
  grouptotal: 150,
  creator: user2.id,
  location: 'Arlington, TX'
}

event_three = {
  title: 'Pasta Making Classes',
  body: 'The team has decided we will be taking pasta making classes until June',
  eventphoto: 'https://images.unsplash.com/photo-1551183053-bf91a1d81141?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fHBhc3RhfGVufDB8fDB8fHww',
  eventamount: 500,
  grouptotal: 100,
  creator: user3.id,
  location: 'Italy (virtual)'
}

event_four = {
  title: "Deliver Seth's Baby",
  body: "Morgan and Son's will be delivering Seth's baby",
  eventphoto: 'https://images.unsplash.com/photo-1583356230736-b5b9ecb85605?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8YmFieSUyMGRlbGl2ZXJ5fGVufDB8fDB8fHww',
  eventamount: 50,
  grouptotal: 45,
  creator: user2.id,
  location: 'Houston, TX'
}

event_five = {
  title: "Grab a Beer With the Boys",
  body: "Let's all grab some after work beers at my fave joint, Chili's",
  eventphoto: 'https://images.unsplash.com/photo-1619290463523-6d18f6a6b220?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjN8fGJ1cmdlciUyMHNsaWRlcnN8ZW58MHx8MHx8fDA%3D',
  eventamount: 30,
  grouptotal: 12,
  creator: user3.id,
  location: 'Cali, TX'
}

event_six = {
  title: "Visit the Moon",
  body: "An experimental, week-long, all-inclusive trip to the moon",
  eventphoto: 'https://images.unsplash.com/photo-1614728263952-84ea256f9679?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8c3BhY2VzaGlwfGVufDB8fDB8fHww',
  eventamount: 5000,
  grouptotal: 2000,
  creator: user1.id,
  location: 'The Moon'
}

# Create events
event_one_record = Event.create!(event_one)
event_two_record = Event.create!(event_two)
event_three_record = Event.create!(event_three)
event_four_record = Event.create!(event_four)
event_five_record = Event.create!(event_five)
event_six_record = Event.create!(event_six)

# Create event participants
events_one_participant1 = EventParticipant.create(
  user_id: user1.id,
  event_id: event_one_record.id,
  individual_contributions: 15
)

events_two_participant1 = EventParticipant.create(
  user_id: user3.id,
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

events_three_participant3 = EventParticipant.create(
  user_id: user3.id,
  event_id: event_three_record.id,
  individual_contributions: 30
)

events_four_participant1 = EventParticipant.create(
  user_id: user1.id,
  event_id: event_four_record.id,
  individual_contributions: 40
)
events_four_participant2 = EventParticipant.create(
  user_id: user2.id,
  event_id: event_four_record.id,
  individual_contributions: 40
)
events_five_participant3 = EventParticipant.create(
  user_id: user3.id,
  event_id: event_five_record.id,
  individual_contributions: 40
)
events_five_participant1 = EventParticipant.create(
  user_id: user1.id,
  event_id: event_five_record.id,
  individual_contributions: 40
)
events_six_participant1 = EventParticipant.create(
  user_id: user1.id,
  event_id: event_six_record.id,
  individual_contributions: 40
)
events_six_participant3 = EventParticipant.create(
  user_id: user3.id,
  event_id: event_six_record.id,
  individual_contributions: 40
)