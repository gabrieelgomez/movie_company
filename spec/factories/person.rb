# frozen_string_literal: true

FactoryBot.define do
  factory :person do
    first_name { Faker::DcComics.name }
    last_name { Faker::Name.last_name }
    aliases { Faker::Internet.username }
    genre { Person::GENRES.sample }
  end
end
