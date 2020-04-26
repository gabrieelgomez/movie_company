# frozen_string_literal: true

FactoryBot.define do
  factory :role do
    name { Role::TYPES.sample }
  end
end
