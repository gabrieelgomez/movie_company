# frozen_string_literal: true

FactoryBot.define do
  factory :movie do
    title { Faker::DcComics.title }
    release_year { Faker::Date.in_date_period }
  end
end
