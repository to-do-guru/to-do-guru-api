# ./app/models/chore.rb
class Chore < ApplicationRecord
  validates_presence_of :name, :duration, :day
  validates_numericality_of :duration
  belongs_to :household

  has_many :member_chores, dependent: :destroy
  has_many :members, through: :member_chores

  enum day: { "Sunday" => 0, "Monday" => 1, "Tuesday" => 2, "Wednesday" => 3, "Thursday" => 4, "Friday" => 5, "Saturday" => 6 }
end
