# frozen_string_literal: true

# CreateMoviePeople migration
class CreateMoviesPeople < ActiveRecord::Migration[6.0]
  def change
    create_table :movies_people do |t|
      t.references :movie
      t.references :person
      t.timestamps
    end
  end
end
