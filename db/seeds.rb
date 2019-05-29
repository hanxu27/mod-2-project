# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Team.destroy_all
Player.destroy_all
Coach.destroy_all
Tryout.destroy_all
Evaluation.destroy_all

# create 50 players
50.times do 
  player = {}
  player[:name] = Faker::FunnyName.unique.two_word_name
  player[:birthday] = Faker::Date.between(14.years.ago, 17.years.ago)
  player[:height] = Faker::Number.between(150, 196)
  if Faker::Number.between(1, 10) < 3
    player[:hand] = 'left'
  else
    player[:hand] = 'right'
  end
  player[:school] = Faker::Movies::HarryPotter.house
  player[:parent_name] = Faker::Movies::HarryPotter.character
  player[:parent_number] = Faker::PhoneNumber.phone_number
  player[:parent_address] = Faker::Address.full_address
  p1 = Faker::Number.between(1, 15)
  p2 = Faker::Number.between(1, 15)
  case p1
  when 1..4
    player[:position_1] = 'OH'
  when 5..7
    player[:position_1] = 'RS'
  when 7..10
    player[:position_1] = 'MB'
  when 11..13
    player[:position_1] = 'DS'
  when 13..15
    player[:position_1] = 'S'
  end
  case p2
  when 1..4
    player[:position_2] = 'OH'
  when 5..7
    player[:position_2] = 'RS'
  when 7..10
    player[:position_2] = 'MB'
  when 11..13
    player[:position_2] = 'DS'
  when 13..15
    player[:position_2] = 'S'
  end
  player[:playing_experience] = Faker::TvShows::RickAndMorty.quote
  player[:additional_comments] = Faker::TvShows::GameOfThrones.quote
  player[:password] = 'password'
  Player.create(player)
end

#create tryout for the 50 players
Player.all.each do |p|
  tryout = {}
  tryout[:season] = 2019
  tryout[:forms_completed] = Faker::Boolean
  tryout[:paid] = Faker::Boolean
  tryout[:reach] = p.height + 35
  tryout[:approach_jump] = tryout[:reach] + rand(30..60)
  tryout[:block_jump] = tryout[:approach_jump] - rand(10..20)
  tryout['point_touch'] = rand(30.0..45.0).round(2)
  tryout['dash'] = rand(3.2..7.5).round(2)
  tryout[:player_id] = p.id
  tryout[:age_group] = rand(14..17)
  Tryout.create(tryout)
end
#create another 20 players not going to tryout
20.times do 
  player = {}
  player[:name] = Faker::FunnyName.unique.two_word_name
  player[:birthday] = Faker::Date.between(14.years.ago, 17.years.ago)
  player[:height] = Faker::Number.between(150, 196)
  if Faker::Number.between(1, 10) < 3
    player[:hand] = 'left'
  else
    player[:hand] = 'right'
  end
  player[:school] = Faker::Movies::HarryPotter.house
  player[:parent_name] = Faker::Movies::HarryPotter.character
  player[:parent_number] = Faker::PhoneNumber.phone_number
  player[:parent_address] = Faker::Address.full_address
  p1 = Faker::Number.between(1, 15)
  p2 = Faker::Number.between(1, 15)
  case p1
  when 1..4
    player[:position_1] = 'OH'
  when 5..7
    player[:position_1] = 'RS'
  when 7..10
    player[:position_1] = 'MB'
  when 11..13
    player[:position_1] = 'DS'
  when 13..15
    player[:position_1] = 'S'
  end
  case p2
  when 1..4
    player[:position_2] = 'OH'
  when 5..7
    player[:position_2] = 'RS'
  when 7..10
    player[:position_2] = 'MB'
  when 11..13
    player[:position_2] = 'DS'
  when 13..15
    player[:position_2] = 'S'
  end
  player[:playing_experience] = Faker::TvShows::RickAndMorty.quote
  player[:additional_comments] = Faker::TvShows::GameOfThrones.quote
end
# 7 coaches
7.times do
  coach = {}
  coach[:name] = Faker::Games::Dota.hero
  coach[:username] = Faker::Games::Dota.player
  coach[:password] = 'coach'
  c1 = Faker::Number.between(1, 3)
  if c1 == 1
    coach[:admin] = true
  else
    coach[:admin] = false
  end
  Coach.create(coach)
end
# 180 evals
180.times do
  eval = {}
  eval[:coachability] = rand(1..10)
  eval[:athleticism] = rand(1..10)
  eval[:serve] = rand(1..10)
  eval[:sr] = rand(1..10)
  eval[:setting] = rand(1..10)
  eval[:hitting] = rand(1..10)
  eval[:communication] = rand(1..10)
  eval[:vball_iq] = rand(1..10)
  eval[:passing] = rand(1..10)
  eval[:team] = rand(1..5).to_s
  eval[:comments] = Faker::Movies::StarWars.quote
  eval[:tryout_id] = Tryout.all.sample.id
  eval[:coach_id] = Coach.all.sample.id
  if rand(1..10) > 8
    eval[:flag] = true
  else
    eval[:flag] = false
  end
  Evaluation.create(eval)
end

4.times do
  i = 14
  while i <= 17 
    Team.create(age_group: i, name: Faker::Games::Pokemon.name)
    i += 1
  end
end
