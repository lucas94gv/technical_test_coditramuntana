# frozen_string_literal: true

FactoryBot.define do
  factory :artist do
    name { Faker::Name.first_name }
    description { Faker::Lorem.sentence }
  end
end
