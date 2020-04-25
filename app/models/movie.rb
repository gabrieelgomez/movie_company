# frozen_string_literal: true

# Movie class
class Movie < ApplicationRecord
  has_and_belongs_to_many :people

  validates :title, :release_year, presence: true

  def people_as(role_name)
    people.includes(:roles).where(roles: { name: role_name&.singularize })
  end
end
