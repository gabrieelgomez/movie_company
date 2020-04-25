# frozen_string_literal: true

# CreatePeopleRoles migration
class CreatePeopleRoles < ActiveRecord::Migration[6.0]
  def change
    create_table(:people_roles, id: false) do |t|
      t.references :person
      t.references :role
    end
  end
end
