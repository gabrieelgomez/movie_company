FactoryBot.define do
  factory :role do
    person_id { rand(3) }
    movie_id  { rand(3) }
    role_type { Role.role_types.keys.sample }
  end
end