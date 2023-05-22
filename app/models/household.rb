# app/models/household.rb
class Household < ApplicationRecord
  has_many :members, dependent: :destroy
  has_many :chores, dependent: :destroy

  def randomize_chores
    chores = self.chores.select(:id, :duration)
    # num_chores = chores.size
    total_duration = self.chores.sum(:duration)
    members = self.members
    # num_members = members.size

    average_duration_per_member = total_duration.to_f / members.size

    assignments = {}
    accumulated_durations = Hash.new(0)

    chores.each do |chore|
      members.each do |member|
        if accumulated_durations[member] + chore[:duration] <= average_duration_per_member
          assignments[chore.id] = member
          accumulated_durations[member] += chore[:duration]
          break
        end
      end
    end
   require 'pry'; binding.pry
  end
end
