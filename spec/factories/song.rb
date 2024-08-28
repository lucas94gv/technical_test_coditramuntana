# frozen_string_literal: true

FactoryBot.define do
  factory :song do
    name { Faker::Book.title }
    lp { FactoryBot.create(:lp) }
  end
end
