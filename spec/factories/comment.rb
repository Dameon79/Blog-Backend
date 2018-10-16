require 'faker'

FactoryBot.define do
  factory :comment do
    article
    name { Faker::FamilyGuy.character }
    body { Faker::FamilyGuy.quote }
  end
end