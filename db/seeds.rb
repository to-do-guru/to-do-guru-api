# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

household_smith = Household.create!(name: "The Smith's House", email: "smith@example.com")
household_doe = Household.create!(name: "The Doe's House", email: "doe@example.com")

smith_member_will = household_smith.members.create!(name: "Will")
smith_member_liz = household_smith.members.create!(name: "Liz")
smith_member_alec = household_smith.members.create!(name: "Alec")

doe_member_jane = household_doe.members.create!(name: "Jane")
doe_member_john = household_doe.members.create!(name: "John")

smith_chore_dishes = household_smith.chores.create!(name: "Clean Dishes", duration: 15, day: 4)
smith_chore_bathroom = household_smith.chores.create!(name: "Clean Bathroom", duration: 45, day: 1)
smith_chore_laundry = household_smith.chores.create!(name: "Laundry", duration: 60, day: 3)
smith_chore_vacuum = household_smith.chores.create!(name: "Vacuum", duration: 45, day: 3)
smith_chore_sweep = household_smith.chores.create!(name: "Sweep", duration: 60, day: 5)
smith_chore_mow = household_smith.chores.create!(name: "Mow", duration: 30, day: 2)

doe_chore_dishes = household_doe.chores.create!(name: "Clean Dishes", duration: 30, day: 1)
doe_chore_bathroom = household_doe.chores.create!(name: "Clean Bathroom", duration: 60, day: 5)
doe_chore_laundry = household_doe.chores.create!(name: "Laundry", duration: 45, day: 3)
doe_chore_vacuum = household_doe.chores.create!(name: "Vacuum", duration: 30, day: 6)

MemberChore.create!(member: smith_member_will, chore: smith_chore_dishes)
MemberChore.create!(member: smith_member_will, chore: smith_chore_bathroom)
MemberChore.create!(member: smith_member_liz, chore: smith_chore_laundry)
MemberChore.create!(member: smith_member_liz, chore: smith_chore_vacuum)
MemberChore.create!(member: smith_member_alec, chore: smith_chore_sweep)
MemberChore.create!(member: smith_member_alec, chore: smith_chore_mow)

MemberChore.create!(member: doe_member_jane, chore: doe_chore_dishes)
MemberChore.create!(member: doe_member_jane, chore: doe_chore_bathroom)
MemberChore.create!(member: doe_member_john, chore: doe_chore_laundry)
MemberChore.create!(member: doe_member_john, chore: doe_chore_vacuum)