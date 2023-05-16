# app/models/household.rb
class Household < ApplicationRecord
  has_many :members, dependent: :destroy
  has_many :chores, dependent: :destroy
end
