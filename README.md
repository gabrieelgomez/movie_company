Movie Company - IT Crowd Challenge
==============================================

#### Environment
----------------------------------------------

- Ruby version: `2.6.5`
- Rails version: `6.0.2`
- Ruby version manager: `rvm`
- Local URL: http://localhost:3000
- Heroku app URL: https://api-movie-company.herokuapp.com

#### API Docs
----------------------------------------------
- Documentation Endpoints [here](docs/api_doc.md)

#### Configuration
----------------------------------------------

- `bundle install`
- `rails db:create`
- `rails db:migrate`
- `rails db:seed`


#### List of most important libraries(gems) used:

* PostgreSQL database.

* Devise token auth for authentication.

* Active model serializer.

* Database cleaner, factory bot, faker and rspect for TDD.

* Rubocop, for good practices and syntax guide style for Ruby

* Apipie to document endpoint


#### Justification of chosen libraries/frameworks against other popular choices.

* I used active model serializer because for me here it is easier to use nested serializers, however I could have used fast_jsonapi from Netflix, which is faster.

* I used rspec as tdd for its extensive doc regarding mini test.

* Converting a date or integer to roman numeral must be a method natively supported by the class, since it is a very common issue to obtain the value of an integer in another measure, for example, roman value, that's why i developed it as a Integer and Date class extension.

#### Usage
----------------------------------------------

#### Example:

1. `rails s`

2. Get session tokens by postman
```
https://api-movie-company.herokuapp.com/api/v1/auth/sign_in
Body JSON :
{
  "email": "user@admin.com",
  "password": "12345678"
}
```

3. Get headers Access-Token, Client and Uid

4. Create Person with tokens
```
POST https://api-movie-company.herokuapp.com/v1/people/create

header: {
  access_token: access_token
  client: client
  uid: uid  
}

body : 
{
  "person":{
    "first_name": "His first name",
    "last_name": "His last name",
    "aliases": "His aliases",
    "genre": "male", or "female"
  }
}
```

5. Create Movie with tokens
```
POST, https://api-movie-company.herokuapp.com/v1/movies/create

header: {
  access_token: access_token
  client: client
  uid: uid  
}

body : 
{
  "movie":{
		"title": "Un titulo",
		"release_year": "20-04-2020",
		"casts_attributes": [
			{
				"person_id": "1",
				"role_id": "1"
			},
			{
				"person_id": "5",
				"role_id": "2"
			}
		]	
	}
}
```

6. Create Cast with tokens
```
POST, https://api-movie-company.herokuapp.com/v1/casts/create

header: {
  access_token: access_token
  client: client
  uid: uid  
}

body : 
{
  "cast":{
		"person_id": 1,
		"movie_id": 1,
		"role_id": 1
	}
}
```