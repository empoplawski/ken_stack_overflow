require 'faker'
include BCrypt

5.times do
  User.create!(username: Faker::Name.first_name, email: Faker::Internet.safe_email, password: "hellohello" )
end

# hashed_password: Password.create("hellohello").to_s

5.times do
  Question.create!(title: Faker::ChuckNorris.fact, description: Faker::Hipster.paragraphs(1).join, asker_id: rand(1..5))
end

5.times do
  Answer.create!(body: Faker::Seinfeld.quote, creator_id: rand(1..5), question_id: rand(1..5))
end

  types = ["Question", "Answer"]

5.times do
  Comment.create!(content: Faker::TheFreshPrinceOfBelAir.quote, commenter_id: rand(1..5), commentable_type: types.sample, commentable_id: rand(1..5))
end

5.times do
  Vote.create!(value: 1, voter_id: rand(1..5), votable_type: types.sample, votable_id: rand(1..5))
end


