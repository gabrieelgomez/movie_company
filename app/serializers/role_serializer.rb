# frozen_string_literal: true

# RoleSerializer class
class RoleSerializer < ActiveModel::Serializer
  attributes :id, :name, :created_at, :updated_at, :people, :movies
end
