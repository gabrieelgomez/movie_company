# frozen_string_literal: true

# MoviesDoc module
module MoviesDoc
  extend Apipie::DSL::Concern

  def_param_group :casts_attributes do
    param :casts_attributes, Hash, required: true, action_aware: true do
      param :person_id, Integer, 'Person id', required: true
      param :role_id, Integer, 'Role id', required: true
    end
  end

  def_param_group :movie do
    param :movie, Hash, required: true, action_aware: true do
      param :title, String, 'Movie title'
      param :release_year, Date, 'Movie release year'
      param_group :casts_attributes
    end
  end

  def_param_group :movie_response do
    param :data, Hash, action_aware: true do
      param :id, String, 'Movie id'
      param :type, String, 'Movie types'
      param_group :movie_attributes
    end
  end

  def_param_group :movie_attributes do
    param :attributes, Hash, required: true, action_aware: true do
      param :title, String, 'Movie title'
      param :release_year, String, 'Movie Release Year'
      param :release_roman, String, 'Movie Release Roman Year'
      param_group :casting
      param_group :directors
      param_group :producers
    end
  end

  def_param_group :persons do
    param :id, String, 'Person id'
    param :first_name, String, 'Person First name'
    param :last_name, String, 'Person Last_name'
    param :aliases, String, 'Person Aliases'
    param :genre, String, 'Person Genre'
    param :created_at, String, 'Person created_at'
    param :updated_at, String, 'Person updated_at'
  end

  def_param_group :casting do
    param :casting, Hash, required: true, action_aware: true do
      param :actors, Hash, required: true, action_aware: true do
      end
      param :actresses, Hash, required: true, action_aware: true do
      end
    end
  end

  def_param_group :directors do
    param :directors, Hash, required: true, action_aware: true do
    end
  end

  def_param_group :producers do
    param :producers, Hash, required: true, action_aware: true do
    end
  end

  api :POST, '/movies', 'Create a movie'
  param_group :movie
  returns :movie_response, desc: 'New movies'
  def create; end

  api :GET, '/movies/:id', 'Show movie'
  param :id, :number, required: true
  returns :movie_response, desc: 'The movie'
  def show; end

  api :GET, '/movies', 'List movies'
  returns array_of: :movie_response, code: 200, desc: 'All movies'
  def index; end

  api :PUT, '/movies', 'Update a movie'
  param_group :movie
  returns :movie_response, desc: 'Update movie'
  def update; end

  api :DELETE, '/movies/:id', 'Delete movie'
  param :id, :number, required: true
  def destroy; end
end
