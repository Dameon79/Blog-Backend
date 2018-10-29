require 'faker'

FactoryBot.define do
  factory :message do
    name { Faker::FamilyGuy.character }
    email { Faker::Internet.email }
    body { Faker::FamilyGuy.quote }
  end
end