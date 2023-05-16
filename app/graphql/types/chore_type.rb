# frozen_string_literal: true

module Types
  class ChoreType < Types::BaseObject
    field :id, ID, null: false
    field :household_id, Integer, null: false
    field :name, String
    field :duration, Integer
    field :day, Integer
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
