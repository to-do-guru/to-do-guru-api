# app/models/household.rb
class Household < ApplicationRecord
  has_many :members
  has_many :chores
end
