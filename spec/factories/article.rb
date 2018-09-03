require 'faker'

FactoryBot.define do
  factory :article do
    title { Faker::FamilyGuy.character }
    text  { Faker::FamilyGuy.quote }
  end
end