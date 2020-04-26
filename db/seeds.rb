# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(
  email: 'user@admin.com',
  password: '12345678',
  password_confirmation: '12345678'
)
p 'User admin created'

Role::TYPES.each do |role|
  Role.create(name: role)
end
p 'Roles created'

30.times do
  person = Person.new(
    first_name: Faker::DcComics.name,
    last_name: Faker::Name.last_name,
    aliases: Faker::Internet.username,
    genre: Person::GENRES.sample
  )
  person.role_ids = Role.all.shuffle[1..2].map(&:id)
  person.save
end
p 'Actors, Directors and Producers created'

10.times do
  movie = Movie.new(
    title: Faker::DcComics.title,
    release_year: Faker::Date.in_date_period
  )
  movie.person_ids = Person.all.shuffle[1..5].map(&:id)
  movie.save
end
p 'Movies created'
