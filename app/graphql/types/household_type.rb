# frozen_string_literal: true

module Types
  class HouseholdType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :email, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :chores, [Types::ChoreType], null: true
    field :members, [Types::MemberType], null: true
    field :sunday, [Types::ChoreType], null: true
    field :monday, [Types::ChoreType], null: true
    field :tuesday, [Types::ChoreType], null: true
    field :wednesday, [Types::ChoreType], null: true
    field :thursday, [Types::ChoreType], null: true
    field :friday, [Types::ChoreType], null: true
    field :saturday, [Types::ChoreType], null: true

    field :errors, [String]

    def sunday
      sunday = object.chores.where(day: "Sunday")
      format_day(sunday)
    end

    def monday
      monday = object.chores.where(day: "Monday")
      format_day(monday)
    end

    def tuesday
      tuesday = object.chores.where(day: "Tuesday")
      format_day(tuesday)
    end

    def wednesday
      wednesday = object.chores.where(day: "Wednesday")
      format_day(wednesday)
    end

    def thursday
      thursday = object.chores.where(day: "Thursday")
      format_day(thursday)
    end

    def friday
      friday = object.chores.where(day: "Friday")
      format_day(friday)
    end

    def saturday
      saturday = object.chores.where(day: "Saturday")
      format_day(saturday)
    end

    def format_day(day)
      return nil if day.empty?

      day
    end
  end
end
