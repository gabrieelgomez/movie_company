# frozen_string_literal: true

# CreateMovies migration
class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.date :release_year, null: false

      t.timestamps
    end
  end
end
