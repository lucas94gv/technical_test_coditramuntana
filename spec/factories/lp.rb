# frozen_string_literal: true

FactoryBot.define do
  factory :lp do
    name { Faker::Name.first_name }
    description { Faker::Music.album }
    artist { FactoryBot.create(:artist) }
  end
end
