# app/models/household.rb
class Household < ApplicationRecord
  has_many :members, dependent: :destroy
  has_many :chores, dependent: :destroy

  has_many :member_chores, through: :members

  def randomize_chores
    destroy_household_member_chores

    randomized_chores = chores.select(:id, :name, :duration).order("RANDOM()").to_a
    randomized_members = members.order("RANDOM()").to_a

    sorted_assigned_chores = {}

    randomized_members.each do |member|
      sorted_assigned_chores[member.id] = []
    end

    until randomized_chores.empty?
      sorted_assigned_chores = sort_member_chores_by_total_duration(sorted_assigned_chores)

      sorted_assigned_chores.each do |assigned_chores|
        next unless member_total_chore_duration(assigned_chores) < average_member_chore_duration

        assigned_chores[1] << randomized_chores.shift
        assigned_chores[1].compact!
        break if member_total_chore_duration(assigned_chores) < average_member_chore_duration
      end
    end

    create_member_chore_records(sorted_assigned_chores)
  end

  private

  def average_member_chore_duration
    chores.sum { |chore| chore.duration }.to_f / members.count
  end

  def member_total_chore_duration(chores)
    chores[1].sum { |chore| chore.duration }
  end

  def sort_member_chores_by_total_duration(chores)
    chores.sort_by { |_member, chores| chores.sum { |chore| chore.duration } }
  end

  def create_member_chore_records(assigned_chores)
    assigned_chores.each do |member_chores|
      member_chores[1].each do |member_chore|
        MemberChore.create!(member_id: member_chores[0], chore_id: member_chore.id)
      end
    end
  end

  def destroy_household_member_chores
    member_chores.each { |member_chore| member_chore.destroy }
  end
end
