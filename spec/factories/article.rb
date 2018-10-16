require 'faker'

FactoryBot.define do
  factory :article do
    title { Faker::FamilyGuy.character }
    text  { Faker::FamilyGuy.quote }

    transient do
      comments { 1 }
    end

    trait :with_comments do
      after(:create) do |article, evaluator|
        create_list(:comment, evaluator.comments, article: article)
      end
    end
  end
end