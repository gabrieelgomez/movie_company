# frozen_string_literal: true

# CreatePeople migration
class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :aliases, null: false
      t.string :genre, null: false

      t.timestamps
    end
  end
end
