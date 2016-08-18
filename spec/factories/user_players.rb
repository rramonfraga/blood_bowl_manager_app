require 'faker'

FactoryGirl.define do
  factory :player do |f|
    f.name { Faker::Internet.name }
    f.player_id {Faker::Number.between(1, 105)}
    f.dorsal {Faker::Number.between(1, 10)}
    f.experience {Faker::Number.between(6, 15)}
    f.level "Rookie"
    f.level_up false
  end
end