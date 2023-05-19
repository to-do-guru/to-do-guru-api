# frozen_string_literal: true

module Types
  class ChoreType < Types::BaseObject
    field :id, ID, null: false
    field :household_id, Integer, null: false
    field :chore_name, String
    field :duration, Integer
    field :day, Integer
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :assigned_member, String

    def chore_name
      object.name
    end

    def assigned_member
      object.members.pick(:name)
    end
  end
end
